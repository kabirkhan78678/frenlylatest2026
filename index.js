import express from "express";
import axios from "axios";
import { userRouter } from "./routes/user.js";
import { blogRouter } from "./routes/blog.js";
import { vlogRouter } from "./routes/vlog.js";
import { postRouter } from "./routes/post.js";
import { homeRouter } from "./routes/home.js";
import { Server } from "socket.io";
import { createServer } from 'http'
import https from 'https';
import fs from 'fs';
import nodemailer from 'nodemailer';
import { initializeSocketIO } from "./utils/socket.js";
import cors from 'cors'
import path from 'path'
import { chatRouter } from "./routes/chat.js";
import { messageRouter } from "./routes/message.js";
import { notificationRouter } from "./routes/notification.js";
import { adminRouter } from "./routes/admin.js";
import { __filename } from "./controllers/userController.js";
import { socketAuth } from "./middlewares/socketAuth.js";
import { responseLocalizationMiddleware } from "./utils/responseLocalization.js";

const __dirname = path.dirname(__filename);
// dotenv.config();
// const port = process.env.PORT
const app = express();
const isLocal = process.env.NODE_ENV !== "production";

app.use(
  cors()
);
app.use(express.json());
app.use(
  express.urlencoded({
    extended: true,
  })
);
app.use(responseLocalizationMiddleware());
app.use(express.static('public'));


const BANKID_API_URL = "https://appapi2.bankid.com/rp/v6.0/auth";
const bankIdCertPath = "/var/www/html/bankid/certificate.pem";
const bankIdKeyPath = "/var/www/html/bankid/private-key.pem";
const bankIdCaPath = "/var/www/html/bankid/Nordea_RP_CA_v1.pem";
const appSslCaPath = "/var/www/html/ssl/ca_bundle.crt";
const appSslKeyPath = "/var/www/html/ssl/private.key";
const appSslCertPath = "/var/www/html/ssl/certificate.crt";
const canUseBankIdCertificates = [bankIdCertPath, bankIdKeyPath, bankIdCaPath].every((filePath) => fs.existsSync(filePath));
const canUseHttpsServerCertificates = [appSslCaPath, appSslKeyPath, appSslCertPath].every((filePath) => fs.existsSync(filePath));

// Load SSL certificates
const agent = canUseBankIdCertificates ? new https.Agent({
  rejectUnauthorized: false,
  cert: fs.readFileSync(bankIdCertPath),
  key: fs.readFileSync(bankIdKeyPath),
  ca: fs.readFileSync(bankIdCaPath),
}) : null;

if (!canUseBankIdCertificates && isLocal) {
  console.log("BankID certificates not found. BankID routes will be disabled in local mode.");
}


const bankIdClient = axios.create({
  baseURL: 'https://appapi2.bankid.com/rp/v6.0',
  // Base URL for BankID API
  httpsAgent: canUseBankIdCertificates ? new https.Agent({
    rejectUnauthorized: false,
    ca: fs.readFileSync(bankIdCaPath),
    key: fs.readFileSync(bankIdKeyPath),
    cert: fs.readFileSync(bankIdCertPath),    // CA root certificate
  }) : undefined,
  // headers: {
  //   'Content-Type': 'application/json',
  // },
});

const mailTransporter = nodemailer.createTransport({
  host: "mailcluster.loopia.se",
  port: 465,
  secure: true,
  auth: {
    user: "no-reply@frenly.se",
    pass: "m4KxkweQXd3acX@"
  }
});
const bankIdMailTemplate = fs.readFileSync(
  path.resolve(__dirname, "../view/frenly_mail.html"),
  "utf-8"
);

app.use(express.static('public'));
const startAuthentication = async (req, res) => {
  if (!canUseBankIdCertificates) {
    return res.status(503).json({ error: 'BankID is disabled in local mode' });
  }

  const { endUserIp, email } = req.body; // Fetch these from frontend

  if (!endUserIp) {
    return res.status(400).json({ error: 'Missing  IP address' });
  }

  try {
    // Call BankID API to start authentication
    const response = await bankIdClient.post('/auth', {
      endUserIp: endUserIp,
      // personalNumber: "199501245204"

    });

    const { orderRef, autoStartToken } = response.data;

    console.log(response.data);

    if (email) {
      try {
        await mailTransporter.sendMail({
          from: '"Frenly" <no-reply@frenly.se>',
          to: email,
          subject: 'BankID Verification Started',
          html: bankIdMailTemplate
        });
      } catch (mailError) {
        console.error('Error sending BankID verification start email:', mailError);
      }
    }

    // Send back orderRef and autoStartToken to the frontend
    return res.status(200).json({ orderRef, autoStartToken });
  } catch (error) {
    console.error('Error starting authentication:', error);
    return res.status(500).json({ error: 'Failed to start BankID authentication' });
  }
};

const collectAuthentication = async (req, res) => {
  if (!canUseBankIdCertificates) {
    return res.status(503).json({ error: 'BankID is disabled in local mode' });
  }

  const { orderRef } = req.body;

  if (!orderRef) {
    return res.status(400).json({ error: 'Missing orderRef' });
  }

  try {

    const response = await bankIdClient.post('/collect', { orderRef });

    const { status, completionData } = response.data;

    if (status === 'complete') {
      const { user, device } = completionData;


      return res.status(200).json({ success: true, user, device });
    } else if (status === 'pending') {

      return res.status(200).json({ success: false, message: 'Authentication is still in progress' });
    } else {

      return res.status(200).json({ success: false, message: 'Authentication failed' });
    }
  } catch (error) {
    console.error('Error collecting authentication result:', error);
    return res.status(500).json({ error: 'Failed to collect authentication result' });
  }
};

app.post("/bankid/auth", async (req, res) => {
  if (!canUseBankIdCertificates || !agent) {
    return res.status(503).json({ error: "BankID is disabled in local mode" });
  }

  try {
    const { endUserIp, personalNumber } = req.body;

    // if (!endUserIp || !personalNumber) {
    //   return res.status(400).json({ error: "Missing required fields" });
    // }

    const response = await axios.post(
      BANKID_API_URL,
      { endUserIp },
      {
        headers: { "Content-Type": "application/json" },
        httpsAgent: agent,
      }
    );

    res.json(response.data);
  } catch (error) {
    console.error("Error authenticating with BankID:", error.message);
    res.status(500).json({ error: "BankID authentication failed", details: error.message });
  }
});


// Expose API route for polling authentication
app.post('/auth/collect', collectAuthentication);


// Expose API route for starting authentication
app.post('/auth/start', startAuthentication);

app.use('/home', homeRouter);
app.use('/user', userRouter);
app.use('/blog', blogRouter);
app.use('/vlog', vlogRouter);
app.use('/post', postRouter);
app.use('/chat', chatRouter);
app.use('/message', messageRouter);
app.use('/notification', notificationRouter);
app.use('/admin', adminRouter);

app.get("/", (req, res) => {
  res.setHeader("Access-Control-Allow-Origin", "*", "https://www.frenly.se:4000", {
    reconnect: true,
  });
  res.header("Access-Control-Allow-Credentials", true);
  res.setHeader("Access-Control-Allow-Methods", "GET,POST,DELETE,PUT,OPTIONS");
  res.setHeader(
    "Access-Control-Allow-Headers",
    "Content-Type,Accept, X-Custom-Header,Authorization"
  );

  if (req.method === "OPTIONS") {
    return res.status(200).end();
  } else {
    return res.send({ success: "0", message: "You are connected to Frenly Backend" });
  }
});


// Read SSL certificate files
const server = canUseHttpsServerCertificates
  ? https.createServer({
    ca: fs.readFileSync(appSslCaPath),
    key: fs.readFileSync(appSslKeyPath),
    cert: fs.readFileSync(appSslCertPath),
  }, app)
  : createServer(app);

if (!canUseHttpsServerCertificates && isLocal) {
  console.log("HTTPS certificates not found. Starting local server over HTTP.");
}

const io = new Server(server, {
  pingTimeout: 60000,
  cors: {
    origin: 'https://www.frenly.se:4000',
    credentials: true,
  },
});
app.set("io", io);

io.use(socketAuth);

initializeSocketIO(io);

server.listen(4000, () => {
  console.log("Node app is running on port 4000");
})



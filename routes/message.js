// routes/message.js
import express from "express";
import { auth } from "../middlewares/auth.js";
import {
    clearChat,
    getAllMessages,
    sendMessage,
} from "../controllers/messageController.js";
import multer from "multer";

export const messageRouter = express.Router();

// Multer config: memory storage (S3 ke liye best)
const upload = multer({
    storage: multer.memoryStorage(),
});

// YAHAN IMPORTANT HAI 👇
// sendMessage ke route pe upload.single('file') LAGNA CHAHIYE
messageRouter.post("/:chatId", auth, upload.single("file"), sendMessage);

messageRouter.get("/:chatId", auth, getAllMessages);
messageRouter.delete("/:chatId", auth, clearChat);

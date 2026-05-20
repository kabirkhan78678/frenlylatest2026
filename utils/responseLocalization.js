import { PrismaClient } from "@prisma/client";
import { normalizeLanguage } from "./notification.js";

const prisma = new PrismaClient();

const messageTranslations = {
    '"name" length must be less than or equal to 15 characters long': {
        en: 'Name must be less than or equal to 15 characters',
        sv: 'Namnet får inte vara längre än 15 tecken'
    },
    "Token Not Provided": { en: "Token Not Provided", sv: "Token saknas" },
    "Access Forbidden": { en: "Access Forbidden", sv: "Atkomst nekad" },
    "Access forbidden": { en: "Access forbidden", sv: "Atkomst nekad" },
    "Internal Server Error": { en: "Internal Server Error", sv: "Internt serverfel" },
    "Internal server error": { en: "Internal server error", sv: "Internt serverfel" },
    "Invalid authenticated user": { en: "Invalid authenticated user", sv: "Ogiltig autentiserad anvandare" },
    "Invalid credentials": { en: "Invalid credentials", sv: "Ogiltiga inloggningsuppgifter" },
    "Invalid login credentials": { en: "Invalid login credentials", sv: "Ogiltiga inloggningsuppgifter" },
    "Login successful!": { en: "Login successful!", sv: "Inloggningen lyckades!" },
    "Please verify your account": { en: "Please verify your account", sv: "Verifiera ditt konto" },
    "Already have an account, Please Login": { en: "Already have an account, Please Login", sv: "Du har redan ett konto, logga in" },
    "Email verification required. Check your inbox for a confirmation link": { en: "Email verification required. Check your inbox for a confirmation link", sv: "E-postverifiering kravs. Kontrollera din inkorg for en bekraftelselank" },
    "User with this email already exits ,please user different email": { en: "User with this email already exists, please use different email", sv: "En anvandare med denna e-post finns redan, anvand en annan e-postadress" },
    "User name already exists ,try different User Name": { en: "User name already exists, try different User Name", sv: "Anvandarnamnet finns redan, prova ett annat anvandarnamn" },
    "User Not Found": { en: "User Not Found", sv: "Anvandaren hittades inte" },
    "User not found": { en: "User not found", sv: "Anvandaren hittades inte" },
    "User Data": { en: "User Data", sv: "Anvandardata" },
    "User Settings": { en: "User Settings", sv: "Anvandarinstallningar" },
    " User Settings": { en: "User Settings", sv: "Anvandarinstallningar" },
    "User Settings Updated": { en: "User Settings Updated", sv: "Anvandarinstallningar uppdaterade" },
    "Data Fetched": { en: "Data Fetched", sv: "Data hamtad" },
    "Notifications": { en: "Notifications", sv: "Notifikationer" },
    "Notification Read": { en: "Notification Read", sv: "Notifikation markerad som last" },
    "Notification Deleted": { en: "Notification Deleted", sv: "Notifikation borttagen" },
    "Notification Not Found": { en: "Notification Not Found", sv: "Notifikation hittades inte" },
    "Notification Not found": { en: "Notification Not found", sv: "Notifikation hittades inte" },
    "Notifications Deleted": { en: "Notifications Deleted", sv: "Notifikationer borttagna" },
    "No Notifications Found": { en: "No Notifications Found", sv: "Inga notifikationer hittades" },
    "Follow Requests": { en: "Follow Requests", sv: "Foljforfragningar" },
    "Follow request sent": { en: "Follow request sent", sv: "Foljforfragan skickad" },
    "Follow request accepted": { en: "Follow request accepted", sv: "Foljforfragan accepterad" },
    "Follow request not found": { en: "Follow request not found", sv: "Foljforfragan hittades inte" },
    "Follow request already exists or already following": { en: "Follow request already exists or already following", sv: "Foljforfragan finns redan eller du foljer redan anvandaren" },
    "Already following this user": { en: "Already following this user", sv: "Du foljer redan denna anvandare" },
    "Successfully followed user": { en: "Successfully followed user", sv: "Anvandaren foljdes" },
    "Successfully unfollowed user": { en: "Successfully unfollowed user", sv: "Anvandaren avfoljdes" },
    "User or user to follow not found": { en: "User or user to follow not found", sv: "Anvandaren eller personen att folja hittades inte" },
    "User to follow not found": { en: "User to follow not found", sv: "Anvandaren att folja hittades inte" },
    "User to unfollow not found": { en: "User to unfollow not found", sv: "Anvandaren att avfolja hittades inte" },
    "Not following this user": { en: "Not following this user", sv: "Du foljer inte denna anvandare" },
    "My Friends": { en: "My Friends", sv: "Mina vanner" },
    "Discover Users": { en: "Discover Users", sv: "Upptack anvandare" },
    "Active Friends": { en: "Active Friends", sv: "Aktiva vanner" },
    "Messages": { en: "Messages", sv: "Meddelanden" },
    "Message sent successfully": { en: "Message sent successfully", sv: "Meddelandet skickades" },
    "Message created": { en: "Message created", sv: "Meddelande skapat" },
    "Uploaded and message created": { en: "Uploaded and message created", sv: "Uppladdning klar och meddelande skapat" },
    "Messages marked as seen": { en: "Messages marked as seen", sv: "Meddelanden markerade som sedda" },
    "Chat created successfully": { en: "Chat created successfully", sv: "Chatten skapades" },
    "Chat retrieved successfully": { en: "Chat retrieved successfully", sv: "Chatten hamtades" },
    "Chats Retrieved Successfully": { en: "Chats Retrieved Successfully", sv: "Chattar hamtade" },
    "Chat Activated": { en: "Chat Activated", sv: "Chat aktiverad" },
    "Chat Deactivated Successfullt": { en: "Chat Deactivated Successfully", sv: "Chat avaktiverad" },
    "Chat Deleted Successfully": { en: "Chat Deleted Successfully", sv: "Chat borttagen" },
    "Chat Cleared Successfully": { en: "Chat Cleared Successfully", sv: "Chat rensad" },
    "Chat does not exist": { en: "Chat does not exist", sv: "Chatten finns inte" },
    "Chat does not exists": { en: "Chat does not exist", sv: "Chatten finns inte" },
    "You are not a participant of this chat": { en: "You are not a participant of this chat", sv: "Du ar inte deltagare i denna chatt" },
    "You cannot chat with yourself": { en: "You cannot chat with yourself", sv: "Du kan inte chatta med dig sjalv" },
    "Receiver does not exist": { en: "Receiver does not exist", sv: "Mottagaren finns inte" },
    "chatId is required": { en: "chatId is required", sv: "chatId kravs" },
    "chatId is required in URL": { en: "chatId is required in URL", sv: "chatId kravs i URL" },
    "Invalid chatId": { en: "Invalid chatId", sv: "Ogiltigt chatId" },
    "File is required": { en: "File is required", sv: "Fil kravs" },
    "File is missing": { en: "File is missing", sv: "Fil saknas" },
    "File too large": { en: "File too large", sv: "Filen ar for stor" },
    "Please Upload Video file": { en: "Please Upload Video file", sv: "Ladda upp en videofil" },
    "Failed to generate thumbnail": { en: "Failed to generate thumbnail", sv: "Det gick inte att skapa miniatyrbild" },
    "Posts": { en: "Posts", sv: "Inlagg" },
    "Post": { en: "Post", sv: "Inlagg" },
    "Post Created Successfully": { en: "Post Created Successfully", sv: "Inlagget skapades" },
    "Post Updated Successfully": { en: "Post Updated Successfully", sv: "Inlagget uppdaterades" },
    "Post Deleted Successfully": { en: "Post Deleted Successfully", sv: "Inlagget togs bort" },
    "Post Fetched Successfully": { en: "Post Fetched Successfully", sv: "Inlagget hamtades" },
    "Post Not Found": { en: "Post Not Found", sv: "Inlagget hittades inte" },
    "Post Not found": { en: "Post Not found", sv: "Inlagget hittades inte" },
    "post Not Found": { en: "Post Not Found", sv: "Inlagget hittades inte" },
    "Commented on the post": { en: "Commented on the post", sv: "Kommenterade inlagget" },
    "Comments on the post": { en: "Comments on the post", sv: "Kommentarer pa inlagget" },
    "Comment on the post Deleted": { en: "Comment on the post Deleted", sv: "Kommentaren pa inlagget togs bort" },
    "Comment Not Found": { en: "Comment Not Found", sv: "Kommentaren hittades inte" },
    "Comment not found": { en: "Comment not found", sv: "Kommentaren hittades inte" },
    "Liked the post": { en: "Liked the post", sv: "Gillade inlagget" },
    "Unliked the post": { en: "Unliked the post", sv: "Tog bort gilla-markering pa inlagget" },
    "Shared the post": { en: "Shared the post", sv: "Delade inlagget" },
    "Post Saved": { en: "Post Saved", sv: "Inlagget sparades" },
    "Post Unsaved": { en: "Post Unsaved", sv: "Inlagget togs bort fran sparade" },
    "My Saved Posts": { en: "My Saved Posts", sv: "Mina sparade inlagg" },
    "Post Profile Already Reported": { en: "Post Profile Already Reported", sv: "Inlagget ar redan rapporterat" },
    "Post Profile Reported Successfully": { en: "Post Profile Reported Successfully", sv: "Inlagget rapporterades" },
    "Blogs": { en: "Blogs", sv: "Bloggar" },
    "Blog": { en: "Blog", sv: "Blogg" },
    "Blog ": { en: "Blog", sv: "Blogg" },
    "Blog Created Successfully": { en: "Blog Created Successfully", sv: "Bloggen skapades" },
    "Blog Updated Successfully": { en: "Blog Updated Successfully", sv: "Bloggen uppdaterades" },
    "Blog Deleted Successfully": { en: "Blog Deleted Successfully", sv: "Bloggen togs bort" },
    "Blog Fetched Successfully": { en: "Blog Fetched Successfully", sv: "Bloggen hamtades" },
    "Blog Not Found": { en: "Blog Not Found", sv: "Bloggen hittades inte" },
    "Blog Not found": { en: "Blog Not found", sv: "Bloggen hittades inte" },
    "Commented on the blog": { en: "Commented on the blog", sv: "Kommenterade bloggen" },
    "Comments on the blog": { en: "Comments on the blog", sv: "Kommentarer pa bloggen" },
    "Comment on the blog Deleted": { en: "Comment on the blog Deleted", sv: "Kommentaren pa bloggen togs bort" },
    "Blog comment not found": { en: "Blog comment not found", sv: "Bloggkommentaren hittades inte" },
    "Liked the blog": { en: "Liked the blog", sv: "Gillade bloggen" },
    "Unliked the blog": { en: "Unliked the blog", sv: "Tog bort gilla-markering pa bloggen" },
    "Shared the blog": { en: "Shared the blog", sv: "Delade bloggen" },
    "Blog Saved": { en: "Blog Saved", sv: "Bloggen sparades" },
    "Blog Unsaved": { en: "Blog Unsaved", sv: "Bloggen togs bort fran sparade" },
    "My Saved Blogs": { en: "My Saved Blogs", sv: "Mina sparade bloggar" },
    "Blog Already Reported": { en: "Blog Already Reported", sv: "Bloggen ar redan rapporterad" },
    "Blog Reported Successfully": { en: "Blog Reported Successfully", sv: "Bloggen rapporterades" },
    "Vlogs": { en: "Vlogs", sv: "Vloggar" },
    "Vlog Created Successfully": { en: "Vlog Created Successfully", sv: "Vloggen skapades" },
    "Vlog Updated Successfully": { en: "Vlog Updated Successfully", sv: "Vloggen uppdaterades" },
    "Vlog updated successfully": { en: "Vlog updated successfully", sv: "Vloggen uppdaterades" },
    "Vlog Deleted Successfully": { en: "Vlog Deleted Successfully", sv: "Vloggen togs bort" },
    "Vlog Fetched Successfully": { en: "Vlog Fetched Successfully", sv: "Vloggen hamtades" },
    "Vlog Not Found": { en: "Vlog Not Found", sv: "Vloggen hittades inte" },
    "Vlog Not found": { en: "Vlog Not found", sv: "Vloggen hittades inte" },
    "vlog Not Found": { en: "Vlog Not Found", sv: "Vloggen hittades inte" },
    "vlog Not found": { en: "Vlog Not found", sv: "Vloggen hittades inte" },
    "Commented on the vlog": { en: "Commented on the vlog", sv: "Kommenterade vloggen" },
    "Comments on the vlog": { en: "Comments on the vlog", sv: "Kommentarer pa vloggen" },
    "Comment on the vlog Deleted": { en: "Comment on the vlog Deleted", sv: "Kommentaren pa vloggen togs bort" },
    "Vlog comment not found": { en: "Vlog comment not found", sv: "Vloggkommentaren hittades inte" },
    "Liked the vlog": { en: "Liked the vlog", sv: "Gillade vloggen" },
    "Unliked the Vlog": { en: "Unliked the Vlog", sv: "Tog bort gilla-markering pa vloggen" },
    "Shared the vlog": { en: "Shared the vlog", sv: "Delade vloggen" },
    "Vlog Saved": { en: "Vlog Saved", sv: "Vloggen sparades" },
    "Vlog Unsaved": { en: "Vlog Unsaved", sv: "Vloggen togs bort fran sparade" },
    "My Saved Vlogs": { en: "My Saved Vlogs", sv: "Mina sparade vloggar" },
    "Vlog Profile Already Reported": { en: "Vlog Profile Already Reported", sv: "Vloggen ar redan rapporterad" },
    "Vlog Profile Reported Successfully": { en: "Vlog Profile Reported Successfully", sv: "Vloggen rapporterades" },
    "Liked the comment post": { en: "Liked the comment post", sv: "Gillade kommentaren pa inlagget" },
    "Unliked the comment post": { en: "Unliked the comment post", sv: "Tog bort gilla-markering pa kommentaren pa inlagget" },
    "Liked the blog comment": { en: "Liked the blog comment", sv: "Gillade bloggkommentaren" },
    "Unliked the blog comment": { en: "Unliked the blog comment", sv: "Tog bort gilla-markering pa bloggkommentaren" },
    "Liked the vlog comment": { en: "Liked the vlog comment", sv: "Gillade vloggkommentaren" },
    "Unliked the vlog comment": { en: "Unliked the vlog comment", sv: "Tog bort gilla-markering pa vloggkommentaren" },
    "My Saved Users": { en: "My Saved Users", sv: "Mina sparade anvandare" },
    "Saved the user": { en: "Saved the user", sv: "Anvandaren sparades" },
    "UnSaved the user": { en: "Unsaved the user", sv: "Anvandaren togs bort fran sparade" },
    "BLocked Users": { en: "Blocked Users", sv: "Blockerade anvandare" },
    "User Already Blocked": { en: "User Already Blocked", sv: "Anvandaren ar redan blockerad" },
    "User Blocked Not Found": { en: "User Blocked Not Found", sv: "Blockeringen hittades inte" },
    "User Blocked Successfully": { en: "User Blocked Successfully", sv: "Anvandaren blockerades" },
    "User Unblocked Successfully": { en: "User Unblocked Successfully", sv: "Anvandaren avblockerades" },
    "Profile Already Reported": { en: "Profile Already Reported", sv: "Profilen ar redan rapporterad" },
    "Profile Reported Successfully": { en: "Profile Reported Successfully", sv: "Profilen rapporterades" },
    "Profile Updated Successfully": { en: "Profile Updated Successfully", sv: "Profilen uppdaterades" },
    "Account deleted Successfully": { en: "Account deleted Successfully", sv: "Kontot raderades" },
    "Account Delete Successfully": { en: "Account Delete Successfully", sv: "Kontot raderades" },
    "Your account has been blocked by the administrator": { en: "Your account has been blocked by the administrator", sv: "Ditt konto har blockerats av administratoren" },
    "Old password is incorrect": { en: "Old password is incorrect", sv: "Det gamla losenordet ar felaktigt" },
    "Password changed successfully": { en: "Password changed successfully", sv: "Losenordet andrades" },
    "Password reset successfully": { en: "Password reset successfully", sv: "Losenordet aterstalldes" },
    "Password reset link sent successfully. Please check your email ": { en: "Password reset link sent successfully. Please check your email", sv: "Lank for aterstallning av losenord skickades. Kontrollera din e-post" },
    "Current Password is Incorrect": { en: "Current Password is Incorrect", sv: "Nuvarande losenord ar felaktigt" },
    "Mail Not Delivered": { en: "Mail Not Delivered", sv: "E-post kunde inte levereras" },
    "Mail Not delivered": { en: "Mail Not delivered", sv: "E-post kunde inte levereras" },
    "Email address not found. Please enter a valid email": { en: "Email address not found. Please enter a valid email", sv: "E-postadressen hittades inte. Ange en giltig e-postadress" },
    "Online ": { en: "Online", sv: "Online" },
    "Offline ": { en: "Offline", sv: "Offline" },
    "Last Seen Data ": { en: "Last Seen Data", sv: "Senast sedd-data" },
    "Viewed the vlog": { en: "Viewed the vlog", sv: "Visade vloggen" },
    "Already Viewed the vlog": { en: "Already Viewed the vlog", sv: "Vloggen har redan visats" },
    "Successfully checkedIn": { en: "Successfully checkedIn", sv: "Incheckning lyckades" },
    "Fetched  the Categories": { en: "Fetched the Categories", sv: "Kategorier hamtade" },
    "Category Created": { en: "Category Created", sv: "Kategori skapad" },
    "Category Not Found": { en: "Category Not Found", sv: "Kategorin hittades inte" },
    "Category Successfully deleted": { en: "Category Successfully deleted", sv: "Kategorin togs bort" },
    "Username Already Registered": { en: "Username Already Registered", sv: "Anvandarnamnet ar redan registrerat" },
    "Username Allowed": { en: "Username Allowed", sv: "Anvandarnamnet ar tillgangligt" },
    "User is private": { en: "User is private", sv: "Anvandaren ar privat" },
    " Update Profile Visibility": { en: "Update Profile Visibility", sv: "Uppdatera profilsynlighet" },
    "All Blogs Fetched Successfully": { en: "All Blogs Fetched Successfully", sv: "Alla bloggar hamtades" },
    "All Posts Fetched Successfully": { en: "All Posts Fetched Successfully", sv: "Alla inlagg hamtades" },
    "All Vlogs Fetched Successfully": { en: "All Vlogs Fetched Successfully", sv: "Alla vloggar hamtades" },
    "Reported Profiles ": { en: "Reported Profiles", sv: "Rapporterade profiler" },
    "Reported Blog Profiles": { en: "Reported Blog Profiles", sv: "Rapporterade bloggar" },
    "Reported Post Profiles": { en: "Reported Post Profiles", sv: "Rapporterade inlagg" },
    "Reported Vlog Profiles": { en: "Reported Vlog Profiles", sv: "Rapporterade vloggar" },
    "Admin not found": { en: "Admin not found", sv: "Administratoren hittades inte" },
    "Admin Not Found": { en: "Admin Not Found", sv: "Administratoren hittades inte" },
    "Admin not found please register your account": { en: "Admin not found please register your account", sv: "Administratoren hittades inte, registrera ditt konto" },
    "Terms and Condition Updated Successfully": { en: "Terms and Condition Updated Successfully", sv: "Villkor uppdaterades" },
    "Privacy And Policy Updated Successfully": { en: "Privacy And Policy Updated Successfully", sv: "Integritetspolicy uppdaterades" },
    "Bulk Notification Successfully Sended to users ": { en: "Bulk Notification Successfully Sent to users", sv: "Massnotifikation skickades till anvandare" },
    "Toggle updated successfully": { en: "Toggle updated successfully", sv: "Vaxeln uppdaterades" },
    "BankID account created successfully": { en: "BankID account created successfully", sv: "BankID-konto skapades" },
    "BankId Toggle": { en: "BankId Toggle", sv: "BankID-vaxel" },
    "Start Process": { en: "Start Process", sv: "Starta processen" },
    "Authentication is still in progress": { en: "Authentication is still in progress", sv: "Autentiseringen pagar fortfarande" },
    "Authentication failed": { en: "Authentication failed", sv: "Autentiseringen misslyckades" },
    "Token generated successfully": { en: "Token generated successfully", sv: "Token skapades" },
    "An internal server error occurred. Please try again later.": { en: "An internal server error occurred. Please try again later.", sv: "Ett internt serverfel uppstod. Forsok igen senare." },
    "Ditt personnummer är redan registrerat på Frenly": { en: "Your personal number is already registered on Frenly", sv: "Ditt personnummer ar redan registrerat pa Frenly" },
    "Din e-post är redan registrerad på Frenly.": { en: "Your email is already registered on Frenly.", sv: "Din e-post ar redan registrerad pa Frenly." },
    "User or User raised a request not found": { en: "User or User raised a request not found", sv: "Anvandaren eller personen som skickade forfragan hittades inte" },
    "You are connected to Frenly Backend": { en: "You are connected to Frenly Backend", sv: "Du ar ansluten till Frenly-backend" },
    "users": { en: "users", sv: "anvandare" },
};

function translateMessage(message, language) {
    if (typeof message !== "string") {
        return message;
    }

    const normalizedLanguage = normalizeLanguage(language);
    const translation = messageTranslations[message];

    if (!translation) {
        return message;
    }

    return translation[normalizedLanguage] ?? translation.en ?? message;
}

async function resolveRequestLanguage(req) {
    if (!req.user?.id || req.originalUrl.startsWith("/admin")) {
        return "sv";
    }

    const userSetting = await prisma.userSetting.findFirst({
        where: { userId: req.user.id },
        select: { language: true },
    });

    return normalizeLanguage(userSetting?.language);
}

export function responseLocalizationMiddleware() {
    return (req, res, next) => {
        const originalJson = res.json.bind(res);

        res.json = async function localizedJson(body) {
            try {
                if (body && typeof body === "object" && typeof body.message === "string") {
                    const language = await resolveRequestLanguage(req);
                    body = {
                        ...body,
                        message: translateMessage(body.message, language),
                    };
                }
            } catch (error) {
                console.error("Response localization failed:", error);
            }

            return originalJson(body);
        };

        next();
    };
}

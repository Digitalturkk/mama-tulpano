import express from 'express';
import {config} from 'dotenv';
import { connectToDatabase, disconnectFromDatabase } from './config/db.js';

// Importing routes
import tulpanoRoutes from './routes/tulpanoRoutes.js';

config();
connectToDatabase();

const app = express();

// API routes
app.use('/tulpanos', tulpanoRoutes);

const PORT = 4040;
const server = app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});

// Handeling exceptions and rejections to ensure graceful shutdown
// Handle unhandled promise rejections 
process.on("unhandledRejection", (err) => {
    console.error("Unhandled Rejection:", err);
    server.close(async () => {
        await disconnectFromDatabase();
        process.exit(1);
    });
});

// Handle uncaught exceptions 
process.on("uncaughtException", async (err) => {
    console.error("Uncaught Exception:", err);
    await disconnectFromDatabase();
    process.exit(1);
});

// SIGTERM signal handling for graceful shutdown
process.on("SIGTERM", async () => {
    console.log("SIGTERM received, shutting down gracefully...");
    server.close(async () => {
        await disconnectFromDatabase();
        console.log("Server closed, exiting process.");
        process.exit(0);
    });
});

import "dotenv/config";
import { PrismaClient } from "@prisma/client";
import { PrismaPg } from "@prisma/adapter-pg";

const adapter = new PrismaPg({
    connectionString: process.env.DATABASE_URL,
});

const prisma = new PrismaClient({
    adapter,
    log: process.env.NODE_ENV === "development" ? ["query", "error", "warn"] : ["error"]
});

const connectToDatabase = async () => {
    try {
        await prisma.$connect();
        console.log("Connected to the database successfully.");
    } catch (error) {
        console.error("Error connecting to the database:", error);
        process.exit(1); // Exit the process with an error code
    }
};

const disconnectFromDatabase = async () => {
    await prisma.$disconnect();
    console.log("Disconnected from the database.");
};

export { connectToDatabase, disconnectFromDatabase };
export default prisma; 
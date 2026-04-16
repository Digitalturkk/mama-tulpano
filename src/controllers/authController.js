import prisma from '../config/db.js';
import bcrypt from 'bcryptjs';

const register = async (req, res) => {
    try {
        const {name, photoUrl, breastSize, pricePerHour, email, phone, password, expirience, mamaId
        } = req.body;

        const normalizedPassword = typeof password === "string" ? password : String(password ?? "");
        if (!normalizedPassword.trim()) {
            return res.status(400).json({message: "Password is required and must be a string."});
        }

        // Checking if the tulpanoo already exists
        const exsistingTulpano = await prisma.tulpano.findUnique({
            where: {
                email: email
            }
        });

        if (exsistingTulpano) {
            return res.status(400).json({message: "Tulpano with this email already exists!"});
        }

        // Hashing the password before saving to the database
        const hashedPassword = await bcrypt.hash(normalizedPassword, 10);

        // Creating a new tulpano
        const newTulpano = await prisma.tulpano.create({
            data: {
                photoUrl,
                name,
                email,
                phone,
                breastSize,
                pricePerHour,
                expirience,
                password: hashedPassword,
                mamaId
            }
        });

        res.status(201).json({
            status: "success",
            data: {
                user: {
                    id: newTulpano.id,
                    name: newTulpano.name,
                    email: newTulpano.email,
                    phone: newTulpano.phone,
                    breastSize: newTulpano.breastSize,
                    pricePerHour: newTulpano.pricePerHour,
                    expirience: newTulpano.expirience,
                    photoUrl: newTulpano.photoUrl,
                    password: newTulpano.password
                }
            }
        });
    } catch (error) {
        console.error("Register error:", error);
        return res.status(500).json({message: "Internal server error during registration."});
    }
};

export { register };
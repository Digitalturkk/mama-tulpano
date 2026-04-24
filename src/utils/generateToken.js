import jwt from "jsonwebtoken";

const generateToken = (tulpanoId, res) => {
    const payload = {
        id: tulpanoId
    };

    const token = jwt.sign(payload, process.env.JWT_SECRET, 
        {expiresIn: process.env.JWT_EXPIRES_IN}
    );
    
    res.cookie("JWT", token, {
            httpOnly: true,
            secure: process.env.NODE_ENV === "production",
            sameSite: "strict",
            maxAge: 7 * 24 * 60 * 60 * 1000
    });
    
    return token;
}

export default generateToken;
import express from "express";

const router = express.Router();

router.get('/salam', (req, res) => {
    res.send('Salam, dünya!');
});

router.get('/siktir', (req, res) => {
    res.json({
        "p1": "siktir ozun",
        "p2": "cixsin gozun!"
    });
});

export default router;
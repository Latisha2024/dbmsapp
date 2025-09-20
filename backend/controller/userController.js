const asyncHandler = require("express-async-handler");
const bcrypt = require("bcrypt");
const User = require("../models/User");
const jwt = require("jsonwebtoken");
const { where } = require("sequelize");

//@desc Register a user
//@route POST /api/users/register
//@access public
const registerUser = asyncHandler(async (req, res) => {
    const {name, phone_no, email, password, address} = req.body;
    if (!name ||!email || !phone_no || !password || !address) {
        res.status(400);
        throw new Error("All fields are mandatory!");
    }
    const userExists = await User.findOne({where: {mail_ID: email}});
    if (userExists) {
        res.status(400);
        throw new Error("User already exists!");
    }
    const hashedPassword = await bcrypt.hash(password, 10);
    const user = await User.create({
        Name: name, 
        mail_ID: email, 
        Phone_number: phone_no, 
        password: hashedPassword, 
        address: address
    })
    res.status(201).json({
        message: "User registered successfully", 
        name: user.Name,
        userID: user.User_ID, 
        email: user.mail_ID
    });
});


//@desc Login a user
//@route POST /api/users/login
//@access public 
const loginUser = asyncHandler(async(req, res) => {
    const {email, password} = req.body;
    if (!email || !password) {
        res.status(400);
        throw new Error("All fields are mandatory!");
    }
    const findUser = await User.findOne({where: {mail_ID: email}});
    if (!findUser) {
        res.status(401);
        throw new Error("User not found!");
    }
    const isMatch = await bcrypt.compare(password, findUser.password);
    if (!isMatch) {
        res.status(401);
        throw new Error("Invalid credentials!");
    }
    const token = jwt.sign({
        userID: findUser.User_ID, 
        email: findUser.mail_ID
    }, 
    process.env.JWT_SECRET, 
    {expiresIn: '1h'});
    res.status(200).json({
        message: "Login successful", 
        token, 
        user: {
            userID: findUser.User_ID, 
            name: findUser.Name,
            email: findUser.mail_ID
        }
    });
});

module.exports = {registerUser, loginUser};
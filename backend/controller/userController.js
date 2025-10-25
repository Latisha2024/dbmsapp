const asyncHandler = require("express-async-handler");
const bcrypt = require("bcrypt");
const User = require("../models/User");
const Admin = require("../models/Admin");
const jwt = require("jsonwebtoken");
const { where } = require("sequelize");

//@desc Register a user or admin
//@route POST /api/users/register
//@access public
const registerUser = asyncHandler(async (req, res) => {
    const { name, phone_no, email, password, address, role } = req.body;

    if (!name || !email || !phone_no || !password || !role) {
        res.status(400);
        throw new Error("All fields are mandatory!");
    }

    // Branch based on role
    if (role === "user") {
        if (!address) {
            res.status(400);
            throw new Error("Address is required for users!");
        }

        const existing = await User.findOne({ where: { mail_ID: email } });
        if (existing) {
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
        });

        return res.status(201).json({
            message: "User registered successfully",
            id: user.User_ID,
            name: user.Name,
            email: user.mail_ID,
            role: "user"
        });

    } else if (role === "admin") {
        const existing = await Admin.findOne({ where: { mail_ID: email } });
        if (existing) {
            res.status(400);
            throw new Error("Admin already exists!");
        }

        const hashedPassword = await bcrypt.hash(password, 10);

        const admin = await Admin.create({
            Name: name,
            mail_ID: email,
            Phone_number: phone_no,
            password: hashedPassword
        });

        return res.status(201).json({
            message: "Admin registered successfully",
            id: admin.Administer_ID,
            name: admin.Name,
            email: admin.mail_ID,
            role: "admin"
        });

    } else {
        res.status(400);
        throw new Error("Invalid role!");
    }
});

//@desc Login a user or admin
//@route POST /api/users/login
//@access public 
const loginUser = asyncHandler(async (req, res) => {
    const { email, password, role } = req.body;

    if (!email || !password || !role) {
        res.status(400);
        throw new Error("All fields are mandatory!");
    }

    let account;
    if (role === "user") {
        account = await User.findOne({ where: { mail_ID: email } });
    } else if (role === "admin") {
        account = await Admin.findOne({ where: { mail_ID: email } });
    } else {
        res.status(400);
        throw new Error("Invalid role!");
    }

    if (!account) {
        res.status(401);
        throw new Error("Account not found!");
    }

    const isMatch = await bcrypt.compare(password, account.password);
    if (!isMatch) {
        res.status(401);
        throw new Error("Invalid credentials!");
    }

    const token = jwt.sign(
        {
            id: account.User_ID || account.Administer_ID,
            email: account.mail_ID,
            role: role
        },
        process.env.JWT_SECRET,
        { expiresIn: "1h" }
    );

    res.status(200).json({
        message: "Login successful",
        token,
        user: {
            id: account.User_ID || account.Administer_ID,
            name: account.Name,
            email: account.mail_ID,
            role: role
        }
    });
});

//@desc Get current user/admin profile
//@route GET /api/users/me
//@access private
const getMe = asyncHandler(async (req, res) => {
    const { id, role } = req.user;

    let account;
    if (role === "user") {
        account = await User.findByPk(id, {
            attributes: ["User_ID", "Name", "mail_ID", "Phone_number", "address"]
        });
    } else if (role === "admin") {
        account = await Admin.findByPk(id, {
            attributes: ["Administer_ID", "Name", "mail_ID", "Phone_number"]
        });
    }

    if (!account) {
        res.status(404);
        throw new Error("Account not found");
    }

    res.status(200).json({
        id: account.User_ID || account.Administer_ID,
        name: account.Name,
        email: account.mail_ID,
        phone: account.Phone_number,
        ...(role === "user" && { address: account.address }),
        role
    });
});

//@desc Update current user/admin profile (including password)
//@route PUT /api/users/update-profile
//@access private
const updateProfile = asyncHandler(async (req, res) => {
    const { id, role } = req.user;
    const { name, phone_no, address, password } = req.body;

    let account;
    if (role === "user") {
        account = await User.findByPk(id);
        if (!account) {
            res.status(404);
            throw new Error("User not found");
        }
        account.Name = name || account.Name;
        account.Phone_number = phone_no || account.Phone_number;
        account.address = address || account.address;

        if (password) {
            // hash new password before saving
            account.password = await bcrypt.hash(password, 10);
        }

        await account.save();
    } else if (role === "admin") {
        account = await Admin.findByPk(id);
        if (!account) {
            res.status(404);
            throw new Error("Admin not found");
        }
        account.Name = name || account.Name;
        account.Phone_number = phone_no || account.Phone_number;

        if (password) {
            account.password = await bcrypt.hash(password, 10);
        }

        await account.save();
    }

    res.status(200).json({
        message: "Profile updated successfully",
        id: account.User_ID || account.Administer_ID,
        name: account.Name,
        email: account.mail_ID,
        phone: account.Phone_number,
        ...(role === "user" && { address: account.address }),
        role
    });
});

module.exports = { registerUser, loginUser, getMe, updateProfile };
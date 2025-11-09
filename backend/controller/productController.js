const asyncHandler = require("express-async-handler");
const Product = require("../models/Product");
const s3 = require('../services/s3Service');
const multer = require('multer');
const upload = multer({ storage: multer.memoryStorage() });

//@desc Get all products
//@route GET /api/products/
//@access public
const getAllProducts = asyncHandler(async(req, res) => {
    const products = await Product.findAll();
    res.status(200).json(products);
});

//@desc Get product by id
//@route GET /api/products/:id
//@access public
const getProductById = asyncHandler(async(req, res) => {
    const product = await Product.findByPk(req.params.id);
    if (!product) {
        res.status(404);
        throw new Error("Product not found!");
    }
    res.status(200).json(product);
});

//@desc Add new product (with optional image upload to S3)
//@route POST /api/products/add
//@access Admin only
const addProduct = asyncHandler(async (req, res) => {
    const { Product_name, Price, Discount, Stock, Description } = req.body;

    if (!Product_name || !Price) {
        res.status(400);
        throw new Error("Product name and price are required!");
    }

    if (!req.file) {
        res.status(400);
        throw new Error("Product image is required");
    }

    let imageUrl = null;
    if (req.file) {
        const key = `${Date.now()}-${req.file.originalname}`;
        const params = {
            Bucket: process.env.AWS_BUCKET_NAME,
            Key: key,
            Body: req.file.buffer,
            ContentType: req.file.mimetype,
            ACL: 'public-read'
        };
        const data = await s3.upload(params).promise();
        imageUrl = data.Location;
    }

    const product = await Product.create({
        Administer_ID: req.user.id,
        Product_name,
        Price,
        Discount: Discount ?? 0.0,
        Stock: Stock ?? 0,
        Image_URL: imageUrl,
        Description
    });

    res.status(201).json({
        message: "Product created successfully",
        product
    });
});

//@desc Update product details (with optional new image upload to S3)
//@route PUT /api/products/update/:id
//@access Admin only
const updateProduct = asyncHandler(async (req, res) => {
    const product = await Product.findByPk(req.params.id);

    if (!product) {
        res.status(404);
        throw new Error("Product not found");
    }

    if (product.Administer_ID !== req.user.id) {
        res.status(403);
        throw new Error("Not authorized to update this product");
    }

    const { Product_name, Price, Discount, Stock, Description } = req.body;

    let imageUrl = product.Image_URL;
    if (req.file) {
        const key = `${Date.now()}-${req.file.originalname}`;
        const params = {
            Bucket: process.env.AWS_BUCKET_NAME,
            Key: key,
            Body: req.file.buffer,
            ContentType: req.file.mimetype,
            ACL: 'public-read'
        };
        const data = await s3.upload(params).promise();
        imageUrl = data.Location;
    }

    product.Product_name = Product_name ?? product.Product_name;
    product.Price = Price ?? product.Price;
    product.Discount = Discount ?? product.Discount;
    product.Stock = Stock ?? product.Stock;
    product.Image_URL = imageUrl;
    product.Description = Description ?? product.Description;

    await product.save();

    res.status(200).json({
        message: "Product updated successfully",
        product
    });
});

//@desc Delete product
//@route DELETE /api/products/:id
//@access Admin only
const deleteProduct = asyncHandler(async (req, res) => {
    const product = await Product.findByPk(req.params.id);
    
    if (!product) {
        res.status(404);
        throw new Error("Product not found!");
    }
    
    // Ownership check
    if (product.Administer_ID !== req.user.id) {
        res.status(403);
        throw new Error("Not authorized to delete this product");
    }

    await product.destroy();

    res.status(200).json({ message: "Product deleted successfully" });
});

//@desc Admin: View own products
//@route GET /api/products/admin
//@access Admin Only
const getProductsByAdmin = asyncHandler(async (req, res) => {
    const adminId = req.user.id;
    const products = await Product.findAll({ where: { Administer_ID: adminId } });
    res.status(200).json(products);
});

module.exports = {
    getAllProducts, 
    getProductById, 
    addProduct, 
    updateProduct, 
    deleteProduct, 
    getProductsByAdmin
};

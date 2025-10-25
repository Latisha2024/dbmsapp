const asyncHandler = require("express-async-handler");
const Product = require("../models/Product");

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

//@desc Add new product
//@route POST /api/products/add
//@access Admin only
const addProduct = asyncHandler(async (req, res) => {
    const { Product_name, Price, Discount, Stock, Image_URL, Description } = req.body;

    if (!Product_name || !Price) {
        res.status(400);
        throw new Error("Product name and price are required!");
    }

    const product = await Product.create({
        Administer_ID: req.user.id,   // admin ID from token
        Product_name,
        Price,
        Discount: Discount ?? 0.0,
        Stock: Stock ?? 0,
        Image_URL,
        Description
    });

    res.status(201).json({
        message: "Product created successfully",
        product
    });
});

//@desc Update product details
//@route PUT /api/products/update/:id
//@access Admin only
const updateProduct = asyncHandler(async (req, res) => {
    const product = await Product.findByPk(req.params.id);

    if (!product) {
        res.status(404);
        throw new Error("Product not found");
    }

    const { Product_name, Price, Discount, Stock, Image_URL, Description } = req.body;

    product.Product_name = Product_name ?? product.Product_name;
    product.Price = Price ?? product.Price;
    product.Discount = Discount ?? product.Discount; 
    product.Stock = Stock ?? product.Stock; 
    product.Image_URL = Image_URL ?? product.Image_URL;
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

    await product.destroy();

    res.status(200).json({ message: "Product deleted successfully" });
});

module.exports = {getAllProducts, getProductById, addProduct, updateProduct, deleteProduct};

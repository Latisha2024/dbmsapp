const asyncHandler = require("express-async-handler");
const Cart = require("../models/Cart");
const Product = require("../models/Product");
const User = require("../models/User");

//@desc Get all cart items for a user
//@route GET /api/cart/:userId
//@access User Only
const getCartByUser = asyncHandler(async (req, res) => {
  const { userId } = req.params;

  // Ownership check
  if (parseInt(userId) !== req.user.id) {
    res.status(403);
    throw new Error("Not authorized to view this cart");
  }

  const cartItems = await Cart.findAll({
    where: { User_ID: userId },
    include: [{ model: Product }]
  });

  res.status(200).json(cartItems);
});

//@desc Add product to cart
//@route POST /api/cart/add
//@access User Only
const addToCart = asyncHandler(async (req, res) => {
  const { Product_ID, Quantity } = req.body;
  const User_ID = req.user.id; // from protect middleware

  // Validate product existence
  const product = await Product.findByPk(Product_ID);
  if (!product) {
    res.status(404);
    throw new Error("Product not found");
  }

  if (Quantity <= 0) {
    res.status(400);
    throw new Error("Quantity must be at least 1");
  }

  if (Quantity > product.Stock) {
    res.status(400);
    throw new Error("Not enough stock available");
  }

  // Check if item already exists in cart
  let cartItem = await Cart.findOne({ where: { User_ID, Product_ID } });

  if (cartItem) {
    cartItem.Quantity += Quantity;
    await cartItem.save();
  } else {
    cartItem = await Cart.create({ User_ID, Product_ID, Quantity });
  }

  res.status(201).json({
    message: "Product added to cart",
    cartItem
  });
});

//@desc Update cart item quantity
//@route PUT /api/cart/:id (cart ID)
//@access User Only
const updateCartItem = asyncHandler(async (req, res) => {
  const { id } = req.params;
  const { Quantity } = req.body;

  const cartItem = await Cart.findByPk(id);
  if (!cartItem) {
    res.status(404);
    throw new Error("Cart item not found");
  }

  // Ownership check
  if (cartItem.User_ID !== req.user.id) {
    res.status(403);
    throw new Error("Not authorized to update this cart item");
  }

  if (Quantity <= 0) {
    res.status(400);
    throw new Error("Quantity must be at least 1");
  }

  const product = await Product.findByPk(cartItem.Product_ID);
  if (Quantity > product.Stock) {
    res.status(400);
    throw new Error("Not enough stock available");
  }

  cartItem.Quantity = Quantity;
  await cartItem.save();

  res.status(200).json({
    message: "Cart item updated",
    cartItem
  });
});

//@desc Remove item from cart
//@route DELETE /api/cart/:id (cart ID)
//@access User Only
const removeCartItem = asyncHandler(async (req, res) => {
  const { id } = req.params;

  const cartItem = await Cart.findByPk(id);
  if (!cartItem) {
    res.status(404);
    throw new Error("Cart item not found");
  }

  // Ownership check
  if (cartItem.User_ID !== req.user.id) {
    res.status(403);
    throw new Error("Not authorized to remove this cart item");
  }

  await cartItem.destroy();

  res.status(200).json({ message: "Cart item removed" });
});

module.exports = {getCartByUser, addToCart, updateCartItem, removeCartItem};

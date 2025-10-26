const express = require("express");
const {getCartByUser, addToCart, updateCartItem, removeCartItem} = require("../controller/cartController");

const protect = require("../middleware/authMiddleware");
const authorize = require("../middleware/authorize");

const router = express.Router();

router.get("/:userId", protect, authorize("user"), getCartByUser);
router.post("/add", protect, authorize("user"), addToCart);
router.put("/:id", protect, authorize("user"), updateCartItem);
router.delete("/:id", protect, authorize("user"), removeCartItem);

module.exports = router;

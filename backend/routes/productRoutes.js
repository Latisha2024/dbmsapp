const express = require("express");
const router = express.Router();

const { getAllProducts, getProductById, addProduct, updateProduct, deleteProduct } = require("../controller/productController");

const protect = require("../middleware/authMiddleware");
const authorize = require("../middleware/authorize");

// Public routes
router.get("/", getAllProducts);
router.get("/:id", getProductById);

// Admin-only routes
router.post("/add", protect, authorize("admin"), addProduct);
router.put("/update/:id", protect, authorize("admin"), updateProduct);
router.delete("/:id", protect, authorize("admin"), deleteProduct);

module.exports = router;

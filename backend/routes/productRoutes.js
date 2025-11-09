const express = require("express");
const router = express.Router();
const upload = require('../middleware/upload');

const { getAllProducts, getProductById, addProduct, updateProduct, deleteProduct, getProductsByAdmin } = require("../controller/productController");

const protect = require("../middleware/authMiddleware");
const authorize = require("../middleware/authorize");

// Public routes
router.get("/", getAllProducts);
router.get("/:id", getProductById);

// Admin-only routes
router.post("/add", protect, authorize("admin"), upload.single("image"), addProduct);
router.put("/update/:id", protect, authorize("admin"), upload.single("image"), updateProduct);
router.get("/admin", protect, authorize("admin"), getProductsByAdmin);
router.delete("/:id", protect, authorize("admin"), deleteProduct);

module.exports = router;

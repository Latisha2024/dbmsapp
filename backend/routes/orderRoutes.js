const express = require("express");
const router = express.Router();
const {placeOrder, getOrdersByUser, cancelOrder, updateOrderStatus, getOrdersByAdmin} = require("../controller/orderController");

const protect = require("../middleware/authMiddleware");
const authorize = require("../middleware/authorize");

// Admin routes
router.get("/admin", protect, authorize("admin"), getOrdersByAdmin);
router.put("/:orderId/status", protect, authorize("admin"), updateOrderStatus);

// User routes
router.post("/:userId", protect, authorize("user"), placeOrder);
router.get("/:userId", protect, authorize("user"), getOrdersByUser);
router.delete("/:userId/:orderId", protect, authorize("user"), cancelOrder);

module.exports = router;

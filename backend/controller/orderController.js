const asyncHandler = require("express-async-handler");
const { Order, OrderItem, Cart, Product, Transaction, User } = require("../models");

//@desc Place a new order (convert cart to order)
//@route POST /api/orders/:userId
//@access User Only

const placeOrder = asyncHandler(async (req, res) => {
    const { userId } = req.params;

    if (parseInt(userId) !== req.user.id) {
        res.status(403);
        throw new Error("Not authorized to place order for this user");
    }

    const cartItems = await Cart.findAll({
        where: { User_ID: userId },
        include: [Product],
    });

    if (!cartItems || cartItems.length === 0) {
        res.status(400);
        throw new Error("Cart is empty");
    }

    let totalAmount = 0;
    for (const item of cartItems) {
        if (item.Quantity > item.Product.Stock) {
            res.status(400);
            throw new Error(`Not enough stock for product ${item.Product.Product_name}`);
        }
        totalAmount += item.Quantity * item.Product.Price;
    }

    const transaction = await Transaction.create({
        User_ID: userId,
        Total_amount: totalAmount,
        PaymentMethod: "COD",
        Status: "Pending",
    });

    const order = await Order.create({
        User_ID: userId,
        Transaction_ID: transaction.Transaction_ID,
        TotalAmount: totalAmount,
        Status: "Pending",
    });

    for (const item of cartItems) {
        await OrderItem.create({
            Order_ID: order.Order_ID,
            Product_ID: item.Product_ID,
            Quantity: item.Quantity,
            Cost: item.Quantity * item.Product.Price,
        });

        item.Product.Stock -= item.Quantity;
        await item.Product.save();
    }

    await Cart.destroy({ where: { User_ID: userId } });

    res.status(201).json({
        message: "Order placed successfully (COD)",
        order,
    });
});

//@desc Get all orders for a user
//@route GET /api/orders/:userId
//@access User Only


const getOrdersByUser = asyncHandler(async (req, res) => {
    const { userId } = req.params;

    if (parseInt(userId) !== req.user.id) {
        res.status(403);
        throw new Error("Not authorized to view these orders");
    }

    const orders = await Order.findAll({
        where: { User_ID: userId },
        include: [OrderItem],
    });

    res.status(200).json(orders);
});


//@desc Cancel an order
//@route DELETE /api/orders/:userId/:orderId
//@access User Only
const cancelOrder = asyncHandler(async (req, res) => {
    const { userId, orderId } = req.params;

    if (parseInt(userId) !== req.user.id) {
        res.status(403);
        throw new Error("Not authorized to cancel this order");
    }

    // Fetch order with items + transaction
    const order = await Order.findByPk(orderId, { 
        include: [OrderItem, Transaction] 
    });

    if (!order) {
        res.status(404);
        throw new Error("Order not found");
    }

    if (order.User_ID !== parseInt(userId)) {
        res.status(403);
        throw new Error("Not authorized to cancel this order");
    }

    if (order.Status !== "Pending") {
        res.status(400);
        throw new Error("Only pending orders can be cancelled");
    }

    // Restore stock for each product in the order
    for (const item of order.OrderItems) {
        const product = await Product.findByPk(item.Product_ID);
        if (product) {
            product.Stock += item.Quantity;
            await product.save();
        }
    }

    // Update order status
    order.Status = "Cancelled";
    await order.save();

    // Update transaction status
    if (order.Transaction) {
        order.Transaction.Status = "Cancelled";
        await order.Transaction.save();
    }

    res.status(200).json({
        message: "Order cancelled successfully",
        order,
        transaction: order.Transaction || null
    });
});

//@desc Admin: Update order status
//@route PUT /api/orders/:orderId/status
//@access Admin Only
const updateOrderStatus = asyncHandler(async (req, res) => {
    const { orderId } = req.params;
    const { Status } = req.body; // e.g., "Shipped", "Delivered", "Cancelled"

    const order = await Order.findByPk(orderId, { include: [Transaction] });
    if (!order) {
        res.status(404);
        throw new Error("Order not found");
    }

    // Update order status
    order.Status = Status;
    await order.save();

    // Update transaction status based on order status
    if (order.Transaction) {
        if (Status === "Delivered" || Status === "Completed") {
            order.Transaction.Status = "Completed";
        } else if (Status === "Cancelled") {
            order.Transaction.Status = "Cancelled";
        } else {
            // For "Pending" or "Shipped"
            order.Transaction.Status = "Pending";
        }
        await order.Transaction.save();
    }

    res.status(200).json({
        message: `Order status updated to ${Status}`,
        order,
        transaction: order.Transaction || null
    });
});
//@desc Admin: Get all orders that include this admin's products
//@route GET /api/admin/orders
//@access Admin Only
const getOrdersByAdmin = asyncHandler(async (req, res) => {
    const adminId = req.user.id;

    const orders = await Order.findAll({
        include: [
            {
                model: OrderItem,
                include: [
                    {
                        model: Product,
                        where: { Administer_ID: adminId }
                    }
                ]
            },
            Transaction,
            { model: User, attributes: ["User_ID", "Name", "mail_ID"] }
        ]
    });

    res.status(200).json(orders);
});

module.exports = { placeOrder, getOrdersByUser, cancelOrder, updateOrderStatus, getOrdersByAdmin };

const sequelize = require("../config/db");

const Admin = require("./Admin");
const Cart = require("./Cart");
const Order = require("./Order");
const OrderItem = require("./OrderItem");
const Product = require("./Product");
const Transaction = require("./Transaction");
const User = require("./User");

// User ↔ Cart
User.hasMany(Cart, { foreignKey: "User_ID", onDelete: "CASCADE", onUpdate: "CASCADE" });
Cart.belongsTo(User, { foreignKey: "User_ID", onDelete: "CASCADE", onUpdate: "CASCADE" });

// User ↔ Transaction
User.hasMany(Transaction, { foreignKey: "User_ID", onDelete: "CASCADE", onUpdate: "CASCADE" });
Transaction.belongsTo(User, { foreignKey: "User_ID", onDelete: "CASCADE", onUpdate: "CASCADE" });

// Transaction ↔ Order (1-to-1, since each transaction corresponds to one order)
Transaction.hasOne(Order, { foreignKey: "Transaction_ID", onDelete: "CASCADE", onUpdate: "CASCADE" });
Order.belongsTo(Transaction, { foreignKey: "Transaction_ID", onDelete: "CASCADE", onUpdate: "CASCADE" });

// User ↔ Order
User.hasMany(Order, { foreignKey: "User_ID", onDelete: "CASCADE", onUpdate: "CASCADE" });
Order.belongsTo(User, { foreignKey: "User_ID", onDelete: "CASCADE", onUpdate: "CASCADE" });

// Order ↔ OrderItem
Order.hasMany(OrderItem, { foreignKey: "Order_ID", onDelete: "CASCADE", onUpdate: "CASCADE" });
OrderItem.belongsTo(Order, { foreignKey: "Order_ID", onDelete: "CASCADE", onUpdate: "CASCADE" });

// Product ↔ OrderItem (snapshot of price at purchase → keep history intact)
Product.hasMany(OrderItem, { foreignKey: "Product_ID", onDelete: "SET NULL", onUpdate: "RESTRICT" });
OrderItem.belongsTo(Product, { foreignKey: "Product_ID", onDelete: "SET NULL", onUpdate: "RESTRICT" });

// Cart ↔ Product (temporary data → cascade delete)
Product.hasMany(Cart, { foreignKey: "Product_ID", onDelete: "CASCADE", onUpdate: "CASCADE" });
Cart.belongsTo(Product, { foreignKey: "Product_ID", onDelete: "CASCADE", onUpdate: "CASCADE" });

// Admin ↔ Product (seller owns products → cascade delete if seller removed)
Admin.hasMany(Product, { foreignKey: "Administer_ID", onDelete: "CASCADE", onUpdate: "CASCADE" });
Product.belongsTo(Admin, { foreignKey: "Administer_ID", onDelete: "CASCADE", onUpdate: "CASCADE" });

module.exports = { sequelize, Admin, Cart, Order, OrderItem, Product, Transaction, User };

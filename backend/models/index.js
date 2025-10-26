const sequelize = require("../config/db");

const Admin = require("./Admin");
const Cart = require("./Cart");
const Order = require("./Order");
const OrderItem = require("./OrderItem");
const Product = require("./Product");
const Transaction = require("./Transaction");
const User = require("./User");

User.hasMany(Cart, { foreignKey: "User_ID" });
Cart.belongsTo(User, { foreignKey: "User_ID" });

User.hasMany(Transaction, { foreignKey: "User_ID" });
Transaction.belongsTo(User, { foreignKey: "User_ID" });

Transaction.hasMany(Order, { foreignKey: "Transaction_ID" });
Order.belongsTo(Transaction, { foreignKey: "Transaction_ID" });

User.hasMany(Order, { foreignKey: "User_ID" });
Order.belongsTo(User, { foreignKey: "User_ID" });

Order.hasMany(OrderItem, { foreignKey: "Order_ID" });
OrderItem.belongsTo(Order, { foreignKey: "Order_ID" });

Product.hasMany(OrderItem, { foreignKey: "Product_ID" });
OrderItem.belongsTo(Product, { foreignKey: "Product_ID" });

Cart.belongsTo(Product, { foreignKey: "Product_ID" });
Product.hasMany(Cart, { foreignKey: "Product_ID" });

Admin.hasMany(Product, { foreignKey: "Administer_ID" });
Product.belongsTo(Admin, { foreignKey: "Administer_ID" });

module.exports = { sequelize, Admin, Cart, Order, OrderItem, Product, Transaction, User };

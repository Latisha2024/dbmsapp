const sequelize = require("../config/db");

const Admin = require("./Admin");
const Cart = require("./Cart");
const Order = require("./Order");
const Product = require("./Product");
const Transaction = require("./Transaction");
const User = require("./User");

User.hasMany(Cart, {foreignKey: 'User_ID'});
Cart.belongsTo(User, {foreignKey: 'User_ID'});

User.hasMany(Transaction, {foreignKey: 'User_ID'});
Transaction.belongsTo(User, {foreignKey: 'User_ID'});

Transaction.hasMany(Order, {foreignKey: "Transaction_ID"});
Order.belongsTo(Transaction, {foreignKey: "Transaction_ID"});

Order.belongsTo(Product, {foreignKey: "Product_ID"});
Product.hasMany(Order, {foreignKey: "Product_ID"});

Cart.belongsTo(Product, {foreignKey: "Product_ID"});
Product.hasMany(Cart, {foreignKey: "Product_ID"});

Admin.hasMany(Product, {foreignKey: "Administer_ID"});
Product.belongsTo(Admin, {foreignKey: "Administer_ID"});

module.exports = {sequelize, Admin, Cart, Order, Product, Transaction, User};
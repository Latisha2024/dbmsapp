const {DataTypes} = require("sequelize");
const sequelize = require("../config/db");

const Order = sequelize.define("Order", {
    Order_ID: {
        type: DataTypes.INTEGER, 
        primaryKey: true,
        autoIncrement: true
    }, 
    Transaction_ID: {
        type: DataTypes.INTEGER,
        allowNull: false
    }, 
    Product_ID: {
        type: DataTypes.INTEGER,
        allowNull: false
    }, 
    Quantity: {
        type: DataTypes.INTEGER, 
        allowNull: false, 
        min: 1, 
        defaultValue: 1
    }, 
    Cost: {
        type: DataTypes.FLOAT,
        allowNull: false, 
        min: 0, 
        defaultValue: 0.00
    }
}, {
    tableName: "Order_details", 
    timestamps: false
});

module.exports = Order;
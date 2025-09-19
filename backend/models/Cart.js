const {DataTypes} = require("sequelize");
const sequelize = require("../config/db");

const Cart = sequelize.define("Cart", {
    Cart_ID: {
        type: DataTypes.INTEGER, 
        primaryKey: true,
        autoIncrement: true
    }, 
    User_ID: {
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
        defaultValue: 1, 
        min: 1
    }, 
}, {
    tableName: "Cart_details", 
    timestamps: false
});

module.exports = Cart;
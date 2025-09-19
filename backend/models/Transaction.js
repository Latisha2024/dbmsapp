const {DataTypes} = require("sequelize");
const sequelize = require("../config/db");

const Transaction = sequelize.define("Transaction", {
    Transaction_ID: {
        type: DataTypes.INTEGER, 
        primaryKey: true,
        autoIncrement: true
    }, 
    User_ID: {
        type: DataTypes.INTEGER,
        allowNull: false
    }, 
    Transaction_time: {
        type: DataTypes.DATE, 
        allowNull: false, 
        defaultValue: DataTypes.NOW
    },
    Total_amount: {
        type: DataTypes.FLOAT,
        allowNull: false, 
        min: 0.00
    }, 
    Status: {
        type: DataTypes.ENUM("Pending", "Completed", "Failed", "Cancelled"),
        allowNull: false, 
        defaultValue: "Pending"
    }
}, {
    tableName: "Transaction_details", 
    timestamps: false
});

module.exports = Transaction;
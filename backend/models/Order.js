const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");

const Order = sequelize.define("Order", {
  Order_ID: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  Transaction_ID: {
    type: DataTypes.INTEGER,
    allowNull: false,
    validate: {
      notNull: { msg: "Transaction_ID is required" },
      isInt: { msg: "Transaction_ID must be an integer" }
    }
  },
  Product_ID: {
    type: DataTypes.INTEGER,
    allowNull: false,
    validate: {
      notNull: { msg: "Product_ID is required" },
      isInt: { msg: "Product_ID must be an integer" }
    }
  },
  Quantity: {
    type: DataTypes.INTEGER,
    allowNull: false,
    defaultValue: 1,
    validate: {
      min: {
        args: [1],
        msg: "Quantity must be at least 1"
      }
    }
  },
  Cost: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: false,
    defaultValue: 0.00,
    validate: {
      min: {
        args: [0],
        msg: "Cost cannot be negative"
      }
    }
  }
}, {
  tableName: "Order_details",
  timestamps: false
});

module.exports = Order;

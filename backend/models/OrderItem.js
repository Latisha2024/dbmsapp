const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");

const OrderItem = sequelize.define("OrderItem", {
  OrderItem_ID: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  Order_ID: {
    type: DataTypes.INTEGER,
    allowNull: false,
    validate: {
      notNull: { msg: "Order_ID is required" },
      isInt: { msg: "Order_ID must be an integer" },
      min: { args: [1], msg: "Order_ID must be positive" }
    }
  },
  Product_ID: {
    type: DataTypes.INTEGER,
    allowNull: false,
    validate: {
      notNull: { msg: "Product_ID is required" },
      isInt: { msg: "Product_ID must be an integer" },
      min: { args: [1], msg: "Product_ID must be positive" }
    }
  },
  Quantity: {
    type: DataTypes.INTEGER,
    allowNull: false,
    defaultValue: 1,
    validate: {
      min: { args: [1], msg: "Quantity must be at least 1" },
      isInt: { msg: "Quantity must be an integer" },
      max: { args: [100], msg: "Quantity cannot exceed 100 per product" }
    }
  },
  Cost: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: false,
    defaultValue: 0.00,
    validate: {
      min: { args: [0], msg: "Cost cannot be negative" },
      isDecimal: { msg: "Cost must be a valid decimal number" }
    }
  }
}, {
  tableName: "OrderItems",
  timestamps: false
});

module.exports = OrderItem;

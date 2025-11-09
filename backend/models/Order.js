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
      isInt: { msg: "Transaction_ID must be an integer" },
      min: { args: [1], msg: "Transaction_ID must be positive" }
    }
  },
  User_ID: {
    type: DataTypes.INTEGER,
    allowNull: false,
    validate: {
      notNull: { msg: "User_ID is required" },
      isInt: { msg: "User_ID must be an integer" },
      min: { args: [1], msg: "User_ID must be positive" }
    }
  },
  TotalAmount: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: false,
    defaultValue: 0.00,
    validate: {
      min: { args: [0], msg: "TotalAmount cannot be negative" },
      isDecimal: { msg: "TotalAmount must be a valid decimal number" }
    }
  },
  Status: {
    type: DataTypes.ENUM("Pending", "Shipped", "Delivered", "Cancelled"),
    allowNull: false,
    defaultValue: "Pending",
    validate: {
      notEmpty: { msg: "Status cannot be empty" }
    }
  }
}, {
  tableName: "Orders",
  timestamps: true
});

module.exports = Order;

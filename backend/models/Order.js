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
  User_ID: {
    type: DataTypes.INTEGER,
    allowNull: false,
    validate: {
      notNull: { msg: "User_ID is required" },
      isInt: { msg: "User_ID must be an integer" }
    }
  },
  TotalAmount: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: false,
    defaultValue: 0.00,
    validate: {
      min: {
        args: [0],
        msg: "TotalAmount cannot be negative"
      }
    }
  },
  Status: {
    type: DataTypes.STRING,
    defaultValue: "Pending"
  }
}, {
  tableName: "Orders",
  timestamps: true
});

module.exports = Order;

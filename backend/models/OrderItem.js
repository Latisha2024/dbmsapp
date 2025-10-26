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
  tableName: "OrderItems",
  timestamps: false
});

module.exports = OrderItem;

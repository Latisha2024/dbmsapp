const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");

const Cart = sequelize.define("Cart", {
  Cart_ID: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
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
  }
}, {
  tableName: "Cart_details",
  timestamps: false
});

module.exports = Cart;

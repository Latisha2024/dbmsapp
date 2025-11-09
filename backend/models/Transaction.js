const { DataTypes, Sequelize } = require("sequelize");
const sequelize = require("../config/db");

const Transaction = sequelize.define("Transaction", {
  Transaction_ID: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  User_ID: {
    type: DataTypes.INTEGER,
    allowNull: false,
    validate: {
      isInt: { msg: "User ID must be an integer" },
      min: { args: [1], msg: "User ID must be positive" }
    }
  },
  Transaction_time: {
    type: DataTypes.DATE,
    allowNull: false,
    defaultValue: Sequelize.literal("CURRENT_TIMESTAMP"),
    validate: {
      isDate: { msg: "Transaction time must be a valid date" }
    }
  },
  Total_amount: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: false,
    validate: {
      min: { args: [0], msg: "Total amount cannot be negative" },
      isDecimal: { msg: "Total amount must be a valid decimal number" }
    }
  },
  Status: {
    type: DataTypes.ENUM("Pending", "Completed", "Failed", "Cancelled"),
    allowNull: false,
    defaultValue: "Pending",
    validate: {
      notEmpty: { msg: "Transaction status cannot be empty" }
    }
  }
}, {
  tableName: "Transaction_details",
  timestamps: false
});

module.exports = Transaction;

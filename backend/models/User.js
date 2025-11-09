const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");

const User = sequelize.define("User", {
  User_ID: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  Name: {
    type: DataTypes.STRING(100), // limit length
    allowNull: false,
    validate: {
      notNull: { msg: "Name is required" },
      notEmpty: { msg: "Name cannot be empty" },
      is: {
        args: /^[A-Za-z\s]+$/, // only alphabets and spaces
        msg: "Name must contain only alphabets"
      }
    }
  },
  Phone_number: {
    type: DataTypes.STRING(10), // exactly 10 characters
    allowNull: false,
    unique: true,
    validate: {
      notNull: { msg: "Phone number is required" },
      notEmpty: { msg: "Phone number cannot be empty" },
      isNumeric: { msg: "Phone number must contain only digits" },
      is: {
        args: /^[6-9]\d{9}$/,
        msg: "Phone number must be a valid 10-digit Indian mobile number starting with 6–9"
      }
    }
  },
  mail_ID: {
    type: DataTypes.STRING(150),
    allowNull: false,
    unique: true,
    validate: {
      notNull: { msg: "Email is required" },
      notEmpty: { msg: "Email cannot be empty" },
      isEmail: { msg: "Must be a valid email address" }
    }
  },
  password: {
    type: DataTypes.STRING,
    allowNull: false,
    validate: {
      notNull: { msg: "Password is required" },
      notEmpty: { msg: "Password cannot be empty" },
      len: {
        args: [8, 64],
        msg: "Password must be between 8 and 64 characters"
      },
      is: {
        args: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).+$/,
        msg: "Password must contain uppercase, lowercase, number, and special character"
      }
    }
  },
  address: {
    type: DataTypes.STRING(255),
    allowNull: false,
    validate: {
      notNull: { msg: "Address is required" },
      notEmpty: { msg: "Address cannot be empty" }
    }
  }
}, {
  tableName: "User_details",
  timestamps: false
});

module.exports = User;

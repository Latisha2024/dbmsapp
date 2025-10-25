const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");

const Admin = sequelize.define("Admin", {
  Administer_ID: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  Name: {
    type: DataTypes.STRING,
    allowNull: false,
    validate: {
      notNull: { msg: "Name is required" },
      notEmpty: { msg: "Name cannot be empty" }
    }
  },
  Phone_number: {
    type: DataTypes.BIGINT,
    allowNull: false,
    validate: {
      notNull: { msg: "Phone number is required" },
      isNumeric: {
        msg: "Phone number must contain only digits"
      },
      len: {
        args: [10, 15],
        msg: "Phone number must be between 10 and 15 digits"
      }
    }
  },
  mail_ID: {
    type: DataTypes.STRING,
    allowNull: false,
    unique: true,
    validate: {
      notNull: { msg: "Email is required" },
      isEmail: {
        msg: "Must be a valid email address"
      }
    }
  },
  password: {
    type: DataTypes.STRING,
    allowNull: false,
    validate: {
      notNull: { msg: "Password is required" },
      len: {
        args: [8],
        msg: "Password must be at least 8 characters long"
      },
      is: {
        args: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$/,
        msg: "Password must contain at least one uppercase letter, one lowercase letter, and one number"
      }
    }
  }
}, {
  tableName: "Administer_details",
  timestamps: false
});

module.exports = Admin;

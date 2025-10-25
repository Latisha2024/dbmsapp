const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");

const Product = sequelize.define("Product", {
  Product_ID: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  Administer_ID: {
    type: DataTypes.INTEGER,
    allowNull: false,
    validate: {
      notNull: { msg: "Administer_ID is required" },
      isInt: { msg: "Administer_ID must be an integer" }
    }
  },
  Product_name: {
    type: DataTypes.STRING,
    allowNull: false,
    validate: {
      notNull: { msg: "Product name is required" },
      notEmpty: { msg: "Product name cannot be empty" }
    }
  },
  Price: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: false,
    validate: {
      notNull: { msg: "Price is required" },
      min: {
        args: [0],
        msg: "Price cannot be negative"
      }
    }
  },
  Discount: {
    type: DataTypes.DECIMAL(5, 2),
    allowNull: false,
    defaultValue: 0.00,
    validate: {
      min: {
        args: [0],
        msg: "Discount cannot be negative"
      },
      max: {
        args: [100],
        msg: "Discount cannot exceed 100%"
      }
    }
  },
  Stock: {
    type: DataTypes.INTEGER,
    allowNull: false,
    defaultValue: 0,
    validate: {
      min: {
        args: [0],
        msg: "Stock cannot be negative"
      }
    }
  },
  Image_URL: {
    type: DataTypes.STRING,
    allowNull: true,
    validate: {
      isUrl: {
        msg: "Image URL must be a valid URL"
      }
    }
  },
  Description: {
    type: DataTypes.STRING,
    allowNull: true
  }
}, {
  tableName: "Product_details",
  timestamps: false
});

module.exports = Product;

const {DataTypes} = require("sequelize");
const sequelize = require("../config/db");

const Product = sequelize.define("Product", {
    Product_ID: {
        type: DataTypes.INTEGER, 
        primaryKey: true,
        autoIncrement: true
    }, 
    Administer_ID: {
        type: DataTypes.INTEGER,
        allowNull: false
    }, 
    Product_name: {
        type: DataTypes.STRING,
        allowNull: false
    }, 
    Price: {
        type: DataTypes.FLOAT,
        allowNull: false, 
        min: 0.00
    }, 
    Discount: {
        type: DataTypes.DECIMAL(5, 2), 
        allowNull: false,
        defaultValue: 0.00,
        min: 0.00, 
        max: 100.00
    }, 
    Stock: {
        type: DataTypes.INTEGER, 
        allowNull: false, 
        defaultValue: 0, 
        min: 0
    }, 
    Image_URL: {
        type: DataTypes.STRING,
        allowNull: true, 
        isUrl: {
            msg: "Image URL must be a valid URL"
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
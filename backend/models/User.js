const {DataTypes} = require("sequelize");
const sequelize = require("../config/db");

const User = sequelize.define("User", {
    User_ID: {
        type: DataTypes.INTEGER, 
        primaryKey: true,
        autoIncrement: true
    }, 
    Name: {
        type: DataTypes.STRING,
        allowNull: false
    }, 
    Phone_number: {
        type: DataTypes.BIGINT,
        allowNull: false, 
        isNumeric: true, 
        len: [10, 15]
    }, 
    mail_ID: {
        type: DataTypes.STRING ,
        allowNull: false, 
        unique: true, 
        isEmail: true
    }, 
    password: {
        type: DataTypes.STRING,
        allowNull: false, 
        validate: {
            len: {
                args: [8],
                msg: 'Password must be at least 8 characters long'
            },
            is: {
                args: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$/,
                msg: 'Password must contain at least one uppercase letter, one lowercase letter, and one number'
            }
        }
    }, 
    address: {
        type: DataTypes.STRING,
        allowNull: false
    }
}, {
    tableName: "User_details", 
    timestamps: false
});

module.exports = User;
// const {Sequelize} = require("sequelize");
// require('dotenv').config({ path: __dirname + '/../.env' });

// const sequelize = new Sequelize(
//     process.env.DB_NAME, 
//     process.env.DB_USER, 
//     process.env.DB_PASS, 
//     {
//         host: process.env.DB_HOST, 
//         dialect: 'mysql', 
//         logging: false
//     }
// );

// module.exports = sequelize;
const { Sequelize } = require("sequelize");
const dotenv = require("dotenv");

// Load environment variables from .env file
dotenv.config();

const sequelize = new Sequelize(
  process.env.DB_NAME,
  process.env.DB_USER,
  process.env.DB_PASS,
  {
    host: process.env.DB_HOST,
    dialect: process.env.DB_DIALECT,
  }
);

sequelize.authenticate()
  .then(() => console.log("✅ MySQL connected"))
  .catch(err => console.error("❌ Database connection failed:", err));

// Export the sequelize instance using CommonJS syntax
module.exports = sequelize;

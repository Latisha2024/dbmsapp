const express = require('express');
const dotenv = require('dotenv');
const cors = require('cors');
const { sequelize } = require('./models');

dotenv.config();

const app = express();

app.use(cors());
app.use(express.json()); 

app.use('/api/users', require('./routes/userRoutes'));

const startServer = async () => {
  try {
    await sequelize.authenticate();
    console.log('Database connected...');
    const PORT = process.env.PORT || 5001;
    app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
  } catch (error) {
    console.error('Unable to connect to the database:', error.message);
  }
};

startServer();

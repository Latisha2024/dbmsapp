const {sequelize} = require("./models/index");

(async() => {
    try {
        await sequelize.authenticate();
        console.log("DB connected");
        await sequelize.sync({alter: true});
        console.log("Models synced");
        process.exit();
    } catch(err) {
        console.log("Error: ", err);
        process.exit(1);
    }
})();
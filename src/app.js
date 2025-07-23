const express = require("express");
require("dotenv").config( { path: __dirname + "/../.env" });
const routes = require('./routes/index');
const PORT = process.env.PORT || 3000;

const app = express();
app.use(express.json());

app.use("/",routes);


app.listen(PORT, () => {
    console.log(`Servidor corriendo en http://localhost: ${PORT}`);
});

console.log("📦 Sequelize config:", {
  DB_USER: process.env.DB_USER,
  DB_PASSWORD: process.env.DB_PASS,
  DB_NAME: process.env.DB_NAME,
});

const { DataTypes } = require('sequelize');
const {sequelize} = require('../database');

const Categoria = sequelize.define("Categoria", {
    
    idCategoria: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },

    nombreCategoria: {
        type: DataTypes.STRING(50),
        allowNull: false
    }
}, 

{
    tableName: "categorias",
    timestamps: false
});


module.exports = Categoria;
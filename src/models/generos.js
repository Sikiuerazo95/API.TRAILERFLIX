const { DataTypes } = require('sequelize');
const {sequelize} = require('../database');

const Genero = sequelize.define("Genero", {
    
    idGenero: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },

    nombreGenero: {
        type: DataTypes.STRING(50),
        allowNull: false
    }
}, 

{
    tableName: "generos",
    timestamps: false
});


module.exports = Genero;
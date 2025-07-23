const { DataTypes } = require('sequelize');
const {sequelize} = require('../database');

const ContenidoCompleto = sequelize.define("ContenidoCompleto", {
    
    idContenido: {
      type: DataTypes.INTEGER,
      primaryKey: true
    },

    titulo: DataTypes.STRING,
    resumen: DataTypes.TEXT,
    temporadas: DataTypes.INTEGER,
    poster: DataTypes.STRING,
    trailer: DataTypes.STRING,
    categoria: DataTypes.STRING,
    genero: DataTypes.STRING,
    tags: DataTypes.STRING,
    reparto: DataTypes.STRING
},

{
   tableName: "contenido_completo",
   timestamps: false
});

module.exports = ContenidoCompleto;
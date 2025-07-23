const { DataTypes } = require('sequelize');
const {sequelize} = require('../database');

const Contenido = sequelize.define("Contenido", {
    
    idContenido: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },

    titulo: {
        type: DataTypes.STRING(100),
        allowNull: false
    },

    resumen: {
        type: DataTypes.TEXT
    },
    
    temporadas: {
        type: DataTypes.INTEGER
    },

    poster: {
        type: DataTypes.STRING(200),
        allowNull: false
        
    },

    trailer: {
        type: DataTypes.STRING(200)
    },

    idCategoria: {
        type: DataTypes.INTEGER,
        references: {
            model: "categorias",
            key: "idCategoria"
        }
    },

    idGenero: {
        type: DataTypes.INTEGER,
        references: {
            model: "generos",
            key: "idGenero"
        }
    }

}, 

{
    tableName: "contenido",
    timestamps: false
});


module.exports = Contenido;
const { DataTypes } = require('sequelize');
const {sequelize} = require('../database');

const ContenidoTag = sequelize.define("ContenidoTag", {
    
    idContenido: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        references: {
            model: "contenido", // nombre de la tabla
            key: "idContenido"
        }
    },

    idTag: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        references: {
            model: "tag",
            key: "idtags"
        }
    }
}, 

{
    tableName: "contenido_tags",
    timestamps: false
});


module.exports = ContenidoTag;
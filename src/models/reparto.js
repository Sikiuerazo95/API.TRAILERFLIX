const { DataTypes } = require('sequelize');
const {sequelize} = require('../database');

const Reparto = sequelize.define("Reparto", {
    
    idContenido: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        references: {
            model: "contenido",
            key: "idContenido"
        }
    },

    idActor: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        references: {
            model: "actores",
            key: "idActor"
        }
    }
}, 

{
    tableName: "reparto",
    timestamps: false
});


module.exports = Reparto;
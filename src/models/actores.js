const { DataTypes } = require('sequelize');
const {sequelize} = require('../database');

const Actor = sequelize.define("Actor", {
    
    idActor: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },

    nombreActor: {
        type: DataTypes.STRING(100),
        allowNull: false,
        unique: true
    }
}, 

{
    tableName: "actores",
    timestamps: false
});


module.exports = Actor;
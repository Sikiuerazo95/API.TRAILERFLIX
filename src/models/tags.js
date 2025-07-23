const { DataTypes } = require("sequelize");
const {sequelize} = require("../database");

const Tag = sequelize.define("Tag", {
    
    idTag: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },

    nombreTag: {
        type: DataTypes.STRING(50),
        allowNull: false
    }
}, 

{
    tableName: "tags",
    timestamps: false
});


module.exports = Tag;
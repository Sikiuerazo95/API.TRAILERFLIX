const {Sequelize} = require('sequelize'); //acá se guardan todos los métodos disponibles de sequalize
//require('dotenv').config();
require('dotenv').config({ path: '../.env' });

    const sequelize = new Sequelize(
        process.env.DB_NAME,
        process.env.DB_USER,
        process.env.DB_PASS,
    {
        host: process.env.DB_HOST,
        dialect: 'mysql',
        logging: false
    }
    ); //se insrancia la librería Sequalize, informando en esta el nombre de la bb.dd., el nombre de usario y la contraseña, a traás de parámetros separados

    async function authenticate() {
        try{
            await sequelize.authenticate();
            console.log('Conexión a la base de datos establecida correctamente.');
        } catch (error){
            console.error('Error al conectar a la base de datos:', error);
        }
    } // función para autenticar la conexión a la base de datos
        
    async function closeConnection() {
        try{
            await sequelize.close();
            console.log('Conexión cerrada correctamente.');
        } catch (error){
            console.error('Error al cerrar la conexión', error);
        }
    } 

    module.exports = { sequelize, authenticate, closeConnection }; // para que poder importar sequelize y las funciones desde otros archivos
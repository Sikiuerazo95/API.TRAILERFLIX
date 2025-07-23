# API.TRAILERFLIX 🎬🍿📺

__API.TRAILERFLIX__ esta diseñada para gestionar catalogos de series y peliculas. Esta Api permite realizar busquedas a traves de distintos endpoints, lo que no solo hace posible **buscar** sino tambien **crear**, **modificar** y **eliminar** registros de forma sencilla, todo con el respaldo de **MySQL** como base de datos.

---

## 📚 Librerías utilizadas

🟢 Node.js
🚂 Express
🐬 MySQL
📦 Body-parser
🔐 Dotenv
📁 Sequelize

---

## ⚙️ Configuracion de entorno

Se creo un archivo **.env** en la raiz del proyecto, para garantizar que la aplicacion funcione correctamente y proteja la informacion sensible.

* PORT
* DB_HOST
* DB_USER
* DB_PASS
* DB_NAME

---

## 🐬 Base de datos **Mysql**

En la base de datos **trailerflix** se almacena informacion sobre **series y peliculas**. Esta informacion se organiza en diferentes tablas que se encuentran relacionadas entre si, y la estructura esta diseñada para ser utilizada en una **API RESTful** que permite **buscar**, **crear**, **modificar** y **eliminar** registros. Ademas se crea una **tabla view** que unifica los datos mas relevantes de cada contenido, facilitando las consultas completas desde un unico punto, esta tabla se implementa como una vista SQL construida a partir de varias tablas relacionadas mediante JOIN.

### categorias

| Campo             | Tipo           | Descripcion                  |
|-------------------|----------------|------------------------------|
| idCategoria       | INT (PK)       | ID unico                     |
| nombreCategoria   | VARCHAR(50)    | Serie o pelicula             |

### generos

| Campo          | Tipo           | Descripcion                  |
|----------------|----------------|------------------------------|
| idGenero       | INT (PK)       | ID unico                     |
| nombreGenero   | VARCHAR(50)    | Terror, comedia, etc..       |

### contenido

| Campo          | Tipo           | Descripcion                              |
|----------------|----------------|------------------------------------------|
| idContenido    | INT (PK)       | ID unico                                 |
| titulo         | VARCHAR(100)   | Titulo de la serie o pelicila pelicula   |
| resumen        | TEXT           | Sinopsis                                 |
| temporadas     | INT            | Numero de temporadas si existen          |
| poster         | VARCHAR(200)   | URL del afiche o portada                 |
| trailer        | VARCHAR(200)   | URL del trailer                          |
| idCategoria    | INT (FK)       | Relación con la tabla `categorias`       |
| idGenero       | INT (FK)       | Relación con la tabla `generos`          |

### tags

| Campo       | Tipo           | Descripcion              |
|-------------|----------------|--------------------------|
| idTag       | INT (PK)       | ID unico                 |
| nombreTag   | VARCHAR(50)    | Accion, drama, etc..     |

### contenido_tags

| Campo          | Tipo           | Descripcion                         |
|----------------|----------------|-------------------------------------|
| idContenido    | INT (FK)       | Relación con la tabla `contenido`   |
| idTag          | INT (FK)       | Relación con la tabla `tags`        |

### actores

| Campo         | Tipo           | Descripcion                  |
|---------------|----------------|------------------------------|
| idActor       | INT (PK)       | ID unico                     |
| nombreActor   | VARCHAR(100)   | Nombre del actor o actriz    |

### reparto

| Campo          | Tipo           | Descripcion                         |
|----------------|----------------|-------------------------------------|
| idContenido    | INT (FK)       | Relación con la tabla `contenido`   |
| idActor        | INT (FK)       | Relación con la tabla `actores`     |

### contenido_completo (tabla view)

| Campo          | Tipo           | Descripcion                                       |
|----------------|----------------|---------------------------------------------------|
| idContenido    | INT (PK)       | ID unico                                          |
| titulo         | VARCHAR(100)   | Titulo de la serie o pelicila pelicula            |
| resumen        | TEXT           | Sinopsis                                          |
| temporadas     | INT            | Numero de temporadas si existen                   |
| poster         | VARCHAR(200)   | URL del afiche o portada                          |
| trailer        | VARCHAR(200)   | URL del trailer                                   |
| categoria      | VARCHAR(50)    | Nombre de la categoria                            |
| genero         | VARCHAR(50)    | Nombre del genero                                 |
| tags           | TEXT           | Lista de etiquetas asociadas separadas por comas  |
| reparto        | TEXT           | Lista de actores vinculados separados por comas   |


A continuacion se muestra un diagrama entidad-relacion que representa visualmente la estructura y las relaciones:

![Diagrama de la base de datos TrailerFlix](./asset/relacion%20de%20tablas.jpg)

---

## 🔌 Conexion a la base de datos

El archivo **app.js** se conecta a la base de datos **Mysql** utlizando un archivo externo llamado **database.js**, que contiene la configuracion y logica de conexion.

* sequelize
* authenticate()
* closeConnection()
  
---



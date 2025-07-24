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

## 🗂️ Estructura general del proyecto

Este proyecto esta organizado en varias carpetas y archivos claves que nos ayudan en la organizacion del codigo y en la escalabilidad de la API.

### `app.js`

Es el archivo principal que configura y levanta el servidor **Express**, configura middlewares globales, como el manejo de JSON con **express.json()**, importa y registra las rutas de la API, define el puerto por el cual se va a escucha el servidor e inicia el servidor.

### Carpeta `models`

La carpeta models contiene los modelos de datos que definen la estructura de las tablas utilizadas en la base de datos de la **API.TRAILERFLIX**, asi como sus relaciones y configuraciones, todos los modelos usan sequelize para definir los tipos de datos y configurar las claves primarias, foraneas y restricciones.

El archivo **registro.js** es el nucleo central de los modelos en la **API.TRAILERFLIX** ya que se encarga de **definir las relaciones** entre las distintas tablas, **importar y registrar** todos los modelos, **configurar y exportar** para poder utilizarlo en diferentes partes de la aplicacion 

```javascript 
const {sequelize} = require('../database');

const Contenido = require('./contenido');
const Actor = require('./actores');
const Reparto = require('./reparto');
const Tag = require('./tags');
const ContenidoTag = require('./contenido_tags');
const ContenidoCompleto = require("./contenido_completo");
const Categoria = require('./categorias');
const Genero = require('./generos');


Contenido.belongsToMany(Tag, {
  through: ContenidoTag,
  foreignKey: 'idContenido',
  otherKey: 'idTag'
});
Tag.belongsToMany(Contenido, {
  through: ContenidoTag,
  foreignKey: 'idTag',
  otherKey: 'idContenido'
});

Contenido.belongsToMany(Actor, {
  through: Reparto,
  foreignKey: 'idContenido',
  otherKey: 'idActor'
});
Actor.belongsToMany(Contenido, {
  through: Reparto,
  foreignKey: 'idActor',
  otherKey: 'idContenido'
});


Contenido.belongsTo(Categoria, {
  foreignKey: 'idCategoria'
});
Categoria.hasMany(Contenido, {
  foreignKey: 'idCategoria'
});

Contenido.belongsTo(Genero, {
  foreignKey: 'idGenero'
});
Genero.hasMany(Contenido, {
  foreignKey: 'idGenero'
});


module.exports = {
  sequelize,
  ContenidoCompleto,
  Contenido,
  Actor,
  Reparto,
  Tag,
  ContenidoTag,
  Categoria,
  Genero
};
```

### Carpeta `routes`

Esta carpeta contiene los archivos que definen las rutas de nuestra **API.TRAILERFLIX**. Cada archivo suele corresponder a un conjunto de funcionalidades y dentro se configuraron las rutas HTTP (GET, POST, PUT, DELETE) para manejar las solicitudes relacionadas.

El archivo **index.js** se encarga de **centralizar y organizar** todos los endpoints de la API.TRAILERFLIX. 

| Método | Ruta                     | Descripción                              | 
| ------ | ------------------------ | ---------------------------------------- |
| GET    | `/catalogo`              | Obtiene todo el contenido del catálogo   |
| GET    | `/catalogo/:id`          | Obtiene un contenido por su ID           | 
| GET    | `/categorias/:categoria` | Filtra contenido por categoría           | 
| GET    | `/generos/:genero`       | Filtra contenido por género              | 
| GET    | `/completo`              | Obtiene el contenido con datos completos | 
| POST   | `/catalogo`              | Crea un nuevo contenido                  |  
| PUT    | `/catalogo/:id`          | Actualiza un contenido existente         | 
| DELETE | `/catalogo/:id`          | Elimina un contenido por su ID           |                                                                           |

### Endpoints disponibles

#### 📍 GET /catalogo
__Descripción:__ Trae la vista completa de toda la base de datos.

---

## 🧾 Descripción

Este endpoint:

- Consulta la vista `contenido_completo`
- Devuelve un array de objetos JSON
- Convierte los campos `tags` y `reparto` de formato string separado por comas a arrays

---

## 🔄 Ejemplo de respuesta (`200 OK`)

```json
[
  {
    "idContenido": 1,
    "titulo": "The Crown",
    "resumen": "Este drama narra las rivalidades políticas...",
    "temporadas": 4,
    "poster": "./posters/1.jpg",
    "trailer": "https://www.youtube.com/embed/JWtnJjn6ng0",
    "nombreCategoria": "Serie",
    "nombreGenero": "Suceso Real",
    "tags": ["Drama", "Suceso Real"],
    "reparto": ["Claire Foy", "Matt Smith"]
  },
  {
    "idContenido": 2,
    "titulo": "Inception",
    "resumen": "Un ladrón roba secretos del subconsciente...",
    ...
  }
]

```

## ❌ Posibles errores

| Código | Descripción                           |
| ------ | ------------------------------------- |
| 500    | Error al consultar contenido completo |

## 📦 Modelos involucrados

const { ContenidoCompleto } = require('../../models/registro');

## 🔮 Pruebas con Postman

1. Seleccionar método: GET

2. URL: http://localhost:3000/endpoints/completo

3. No se requiere body ni headers especiales

4. Click en Send para recibir la lista de contenido

* NOTA: Asegurase de que la vista contenido_completo esté correctamente creada en tu base de datos MySQL. El backend transforma internamente los strings de tags y reparto en arrays antes de devolverlos.

---

#### 📍 GET /completo

📖 **Descripción:** Devuelve el catálogo completo de títulos en TrailerFlix.

✅ **Respuesta exitosa (200):** Array de objetos con los títulos disponibles, sus categorías y géneros.

❌ **Error (500):**

```json
{ "error": "Hubo un error en el servidor" }
```

**Archivo asociado:** `getAll.js`

---

#### 📍 GET /catalogo/:id 

📖 **Descripción:** Devuelve la información de un título específico según su `idContenido`.

📥 **Parámetros de ruta:**

* `id`: número de ID del contenido a buscar.

✅ **Respuesta exitosa (200):** Objeto con la información del título encontrado.

❌ **Error (404):**

```json
{ "error": "No encontrado" }
```

❌ **Error (500):**

```json
{ "error": "Hubo un error en el servidor" }
```

**Archivo asociado:** `getByID.js`

---

#### 📍 GET /categorias/:categoria 

📖 **Descripción:** Devuelve los títulos filtrados por la categoría proporcionada.

📥 **Parámetros de ruta:**

* `categoria`: nombre de la categoría a buscar.

✅ **Respuesta exitosa (200):** Array de objetos con los títulos encontrados.

❌ **Error (400):**

```json
{ "error": "Falta el parámetro de categoría" }
```

❌ **Error (500):**

```json
{ "error": "Hubo un error en el servidor" }
```

**Archivo asociado:** `getByCategorias.js`

---

### 📍 GET /generos/:genero

📖 **Descripción:** Devuelve los títulos filtrados por el género proporcionado.

📥 **Parámetros de ruta:**

* `genero`: nombre del género a buscar.

✅ **Respuesta exitosa (200):** Array de objetos con los títulos encontrados.

❌ **Error (400):**

```json
{ "error": "Falta el parámetro de género" }
```

❌ **Error (500):**

```json
{ "error": "Hubo un error en el servidor" }
```

**Archivo asociado:** `getByGeneros.js`



#### 📍 POST /catalogo
---

## 🛋️ JSON esperado (Body)

```json
{
  "titulo": "The Crown",
  "resumen": "Este drama narra las rivalidades políticas y romances durante el reinado de Isabel II.",
  "temporadas": 4,
  "poster": "./posters/1.jpg",
  "trailer": "https://www.youtube.com/embed/JWtnJjn6ng0",
  "categoria": "Serie",
  "genero": "Suceso Real",
  "tags": "Drama,Suceso Real",
  "reparto": "Claire Foy, Helena Bonham Carter, Matt Smith"
}
```

> ⚠️ Los campos `tags` y `reparto` deben enviarse como **strings separados por comas**.

---

## ✅ Funcionamiento del endpoint

1. Busca el **ID** correspondiente al nombre de la categoría enviada.
2. Busca el **ID** correspondiente al nombre del género enviado.
3. Crea un nuevo registro en la tabla `contenido`.
4. Procesa los `tags`:

   * Si existen, los vincula.
   * Si no existen, los crea y luego los vincula (tabla `contenido_tags`).
5. Procesa el `reparto`:

   * Si los actores ya existen, los vincula.
   * Si no existen, los crea y luego los vincula (tabla `reparto`).

---

## 🔹 Respuesta exitosa (`201 Created`)

```json
{
  "message": "Contenido creado correctamente",
  "contenido": {
    "idContenido": 5,
    "titulo": "The Crown",
    "resumen": "...",
    "temporadas": 4,
    "poster": "./posters/1.jpg",
    "trailer": "https://www.youtube.com/embed/JWtnJjn6ng0",
    "idCategoria": 2,
    "idGenero": 3
  }
}
```

---

## ❌ Posibles errores

| Código | Descripción                  |
| ------ | ---------------------------- |
| 400    | Faltan campos obligatorios   |
| 400    | Categoría no encontrada      |
| 400    | Género no encontrado         |
| 500    | Error interno en el servidor |

---

## 🔮 Pruebas con Postman

1. Seleccionar el método `POST` y URL: `http://localhost:3000/endpoints`
2. Ir a la pestaña **Body** > seleccionar **raw** > tipo **JSON**
3. Pegar el cuerpo de ejemplo en el editor
4. Click en **Send**

---

## 🔧 Campos requeridos

Este endpoint utiliza los siguientes modelos:

* `Contenido`
* `Categoria`
* `Genero`
* `Tag`
* `ContenidoTag`
* `Actor`
* `Reparto`

* NOTA: Hay que asegurarse de que todas las tablas existen y están correctamente relacionadas en la base de datos.

---


#### 📍 PUT /catalogo/:id

__Descripción:__ Este endpoint permite **modificar** los datos de un contenido previamente creado. Puede actualizar cualquier campo enviado en el cuerpo de la petición.

* NOTA: No se puede modificar el campo `_id`.


## 💡 Endpoint

```
PUT /catalogo/:id
```

---

## 🛋️ JSON esperado (Body)

Se puede enviar cualquiera de los siguientes campos para actualizar:

```json
{
  "titulo": "Nuevo título opcional",
  "resumen": "Nuevo resumen opcional",
  "temporadas": 5,
  "poster": "./posters/nuevo.jpg",
  "trailer": "https://www.youtube.com/embed/nuevo"
}
```

> ⚠️ Este endpoint **no modifica** los tags ni el reparto. Solo afecta la tabla `contenido` directamente.

---

## ✅ Funcionamiento del endpoint

1. Busca el contenido por ID (`req.params.id`).
2. Si no existe, devuelve error 404.
3. Si existe, actualiza los campos enviados mediante `req.body`.
4. Devuelve el contenido actualizado como respuesta.

---

## 🔹 Respuesta exitosa (`200 OK`)

```json
{
  "idContenido": 5,
  "titulo": "Nuevo título opcional",
  "resumen": "Nuevo resumen opcional",
  "temporadas": 5,
  "poster": "./posters/nuevo.jpg",
  "trailer": "https://www.youtube.com/embed/nuevo",
  "idCategoria": 2,
  "idGenero": 3
}
```

---

## ❌ Posibles errores

| Código | Descripción                   |
| ------ | ----------------------------- |
| 404    | Título no encontrado          |
| 500    | Error al actualizar contenido |

---

## 🔮 Pruebas con Postman

1. Seleccionar el método `PUT` y la URL: `http://localhost:3000/catalogo/5`
2. Ir a la pestaña **Body** > seleccionar **raw** > tipo **JSON**
3. Enviar los campos que se deseen modificar
4. Click en **Send**

---

## 🔧 Dependencias requeridas

Este endpoint utiliza el siguiente modelo:

* `Contenido`

---


#### 📍 DELETE /catalogo/:id

__Descripción:__ Este endpoint elimina un ID y todos sus datos de la base de datos.

---

## 🗂️ Endpoint

```
DELETE /catalogo/:id
```

---

## 🔄 Funcionamiento

1. Recibe el parámetro `id` para identificar el contenido.
2. Verifica que el contenido exista en la base de datos (`Contenido.findByPk`).
3. Elimina las entradas asociadas:
   * `contenido_tags`
   * `reparto`
4. Luego elimina el contenido en sí.

---

## ✅ Respuesta exitosa

```json
{
  "message": "Titulo eliminado correctamente"
}
```

---

## ❌ Posibles errores

| Código | Descripción                 |
| ------ | --------------------------- |
| 404    | Título no encontrado        |
| 500    | Error al eliminar el título |

---

## 📦 Modelos involucrados

* `Contenido`
* `ContenidoTag`
* `Reparto`

---

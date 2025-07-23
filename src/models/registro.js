const {sequelize} = require('../database');

const Contenido = require('./contenido');
const Actor = require('./actores');
const Reparto = require('./reparto');
const Tag = require('./tags');
const ContenidoTag = require('./contenido_tags');
const ContenidoCompleto = require("./contenido_completo");
const Categoria = require('./categorias');
const Genero = require('./generos');

// contenido - tags (muchos a muchos mediantte contenido_tags)
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

// contenido - actores (muchos a muchos mediante reparto)
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

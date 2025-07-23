const {Contenido, Categoria, Genero, Tag, ContenidoTag, Actor, Reparto}= require('../../models/registro');

module.exports = async (req, res) => {
  try {
    const {
      titulo,
      resumen,
      temporadas,
      poster,
      trailer,
      categoria,
      genero,
      tags,
      reparto
    } = req.body;

    if (!titulo || !resumen || !temporadas || !poster || !trailer || !categoria || !genero || !tags || !reparto ) {
      return res.status(400).json({ error: 'Faltan campos obligatorios' });
    }
    
    // Busca idCategoria
    const cat = await Categoria.findOne({ where: { nombreCategoria: categoria } });
    if (!cat) return res.status(400).json({ error: 'Categoría no encontrada' });

    // Busca idGenero
    const gen = await Genero.findOne({ where: { nombreGenero: genero } });
    if (!gen) return res.status(400).json({ error: 'Género no encontrado' });

    // Crea nuevo contenido
    const nuevoContenido = await Contenido.create({
      titulo,
      resumen,
      temporadas,
      poster,
      trailer,
      idCategoria: cat.idCategoria,
      idGenero: gen.idGenero
    });

    // Procesa los tags
    const tagsArray = tags.split(',').map(t => t.trim());
    for (const nombreTag of tagsArray) {
      let tag = await Tag.findOne({ where: { nombreTag } });
      if (!tag) {
        tag = await Tag.create({ nombreTag });
      }
      await ContenidoTag.create({
        idContenido: nuevoContenido.idContenido,
        idTag: tag.idTag
      });
    }

    // Procesa el reparto 
    const repartoArray = reparto.split(',').map(a => a.trim());
    for (const nombreActor of repartoArray) {
      let actor = await Actor.findOne({ where: { nombreActor } });
      if (!actor) {
        actor = await Actor.create({ nombreActor });
      }
      await Reparto.create({
        idContenido: nuevoContenido.idContenido,
        idActor: actor.idActor
      });
    }

    res.status(201).json({
      message: 'Contenido creado correctamente',
      contenido: nuevoContenido
    });

  } catch (error) {
      console.error('Error al crear contenido:', error);
      res.status(500).json({ error: 'Error al crear un nuevo titulo' });
  }
};
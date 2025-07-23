const {Contenido, ContenidoTag, Reparto} = require('../../models/registro');

module.exports = async (req, res) => {
  try {
    
    const id = req.params.id;
    const resultado = await Contenido.findByPk(id);
    if (!resultado){
        return res.status(404).json({error: 'Título no encontrado'});
    }
    
    // Elimina lo asocuado con contenido_tags
    await ContenidoTag.destroy({ 
      where: { idContenido: id }
    });

    // Elimina lo asociado con reparto
    await Reparto.destroy({ 
      where: { idContenido: id }
    });

    // Ahora sí elimina el contenido
    await resultado.destroy(); 

    res.status(200).json({message: 'Titulo eliminado correctamente'});
    } catch (error) {
      console.error('Error al crear contenido:', error);
      res.status(500).json({ error: 'Error al eliminar el titulo' });
  } 
};
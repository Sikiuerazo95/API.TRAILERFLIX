const {Contenido} = require('../../models/registro');

module.exports = async (req, res) => {
  try {
    const categoria = req.params.cat;

    const resultado = await Contenido.findByPk(req.params.id);
    if (!resultado){
        return res.status(404).json({error: 'Título no encontrado'});
    }
    await resultado.update(req.body);

    res.status(200).json(resultado);
    } catch (error) {
    res.status(500).json({ error: 'Error al actualizar el titulo' });
  } 
};
const {ContenidoCompleto} = require("../../models/registro");

module.exports = async (req, res) => {
  try {
    const { categoria } = req.params;

    if (!categoria) {
      return res.status(400).json({ error: "Falta el parámetro de categoría" });
    }   

    const resultado = await ContenidoCompleto.findAll({
      where: { categoria }
    });

    res.status(200).json(resultado);
  } catch (error) {
    console.error('Error al crear contenido:', error);
    res.status(500).json({ error: "Hubo un error en el servidor" });
  }
};
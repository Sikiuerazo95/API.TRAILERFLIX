const {ContenidoCompleto} = require("../../models/registro");

module.exports = async (req, res) => {
  try {
    const { genero } = req.params;

    if (!genero) {
      return res.status(400).json({ error: "Falta el parámetro de género" });
    }

    const resultado = await ContenidoCompleto.findAll({
      where: { genero }
    });

    res.status(200).json(resultado);
  } catch (error) {
    console.error('Error al crear contenido:', error);
    res.status(500).json({ error: "Hubo un error en el servidor" });
  }
};
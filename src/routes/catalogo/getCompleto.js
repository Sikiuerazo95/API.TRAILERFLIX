const { ContenidoCompleto } = require("../../models/registro");

module.exports = async (req, res) => {
  try {
    const completo = await ContenidoCompleto.findAll();

    const resultado = completo.map(item => {
      const json = item.toJSON();

      json.tags = json.tags
        ? json.tags.split(',').map(tag => tag.trim())
        : '';

      json.reparto = json.reparto
        ? json.reparto.split(',').map(actor => actor.trim())
        : '';

      return json;
    });

    res.status(200).json(resultado);
  } catch (error) {
    console.error("Error al obtener contenido completo:", error);
    res.status(500).json({ error: "Error al consultar contenido completo" });
  }
};

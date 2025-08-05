// GET /trailerflix - catálogo 
const { Contenido, Categoria, Genero } = require("../../models/registro");

module.exports = async (req, res) => {
  try {
    const resultado = await Contenido.findAll({
      include: [
        {model: Categoria},
        {model: Genero}
      ]
    });
    res.status(200).json(resultado);
  } catch (error){
     console.error("🔥 Error en GET /catalogo:", error);
      res.status(500).json({ error: "Hubo un error en el servidor"});
  }
};

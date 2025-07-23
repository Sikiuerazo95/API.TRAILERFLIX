const {Contenido} = require("../../models/registro");

module.exports = async (req, res) => {
  try {
    const resultado = await Contenido.findAll({
      where: { idContenido: req.params.id}
    }); // findAll() no acepta un número suelto como parámetro. Necesita un objeto con opciones.
    
    if (resultado.length === 0) {
      return res.status(404).json({ error: "No encontrado" });
    }

    res.status(200).json (resultado);
  } catch (error){
      console.error("Error real:", error); 
      res.status(500).json({ error: "Hubo un error en el servidor" });
  }
};

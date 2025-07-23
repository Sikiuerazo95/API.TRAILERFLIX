const express = require ("express");
const router = express.Router();

const getAll = require("./catalogo/getAll");
const getByID = require("./catalogo/getByID");
const getByCategorias = require("./catalogo/getByCategorias");
const getByGeneros = require("./catalogo/getByGeneros");
const getCompleto = require("./catalogo/getCompleto");
const create = require("./catalogo/create");
const update = require("./catalogo/update");
const remove = require("./catalogo/delete"); 

router.get ("/catalogo", getAll);
router.get ("/catalogo/:id", getByID);
router.get ("/categorias/:categoria", getByCategorias);
router.get ("/generos/:genero", getByGeneros);
router.get ("/completo", getCompleto);
router.post ("/catalogo", create);
router.put ("/catalogo/:id", update);
router.delete ("/catalogo/:id", remove);

module.exports = router;


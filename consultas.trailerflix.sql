SELECT c.titulo, g.nombreGenero
FROM contenido c
JOIN categorias cat ON c.idCategoria = cat.idCategoria
JOIN generos g ON c.idGenero = g.idGenero
WHERE cat.nombreCategoria = 'Película'
  AND g.nombreGenero IN ('Acción', 'Terror', 'Suspenso');



SELECT c.titulo, g.nombreGenero
FROM contenido c
JOIN generos g ON c.idGenero = g.idGenero
JOIN categorias cat ON c.idCategoria = cat.idCategoria
WHERE cat.nombreCategoria = 'Película' 
  AND g.nombreGenero IN ('Acción', 'Terror', 'Suspenso');


SELECT DISTINCT c.titulo
FROM contenido c
JOIN categorias cat ON c.idCategoria = cat.idCategoria
JOIN contenido_tags ct1 ON c.idContenido = ct1.idContenido
JOIN tags t1 ON ct1.idTags = t1.idTags
JOIN contenido_tags ct2 ON c.idContenido = ct2.idContenido
JOIN tags t2 ON ct2.idTags = t2.idTags
WHERE cat.nombreCategoria = 'Película'
  AND (
    (t1.nombreTag = 'Aventura' AND t2.nombreTag = 'Ciencia Ficción') OR
    (t1.nombreTag = 'Aventura' AND t2.nombreTag = 'Fantasía')
  );



SELECT c.titulo, cat.nombreCategoria
FROM contenido c
JOIN categorias cat ON c.idCategoria = cat.idCategoria
WHERE resumen LIKE '%misión%';


SELECT titulo, temporadas
FROM contenido c
JOIN categorias cat ON c.idCategoria = cat.idCategoria
WHERE cat.nombreCategoria = 'Serie' AND temporadas >= 3;


SELECT COUNT(DISTINCT r.idContenido) AS trabajos
FROM reparto r
JOIN actores a ON r.idActor = a.idActor
WHERE a.nombreActor = 'Chris Pratt';


SELECT 
  a.nombreActor, 
  c.titulo, 
  cat.nombreCategoria AS categoria, 
  g.nombreGenero AS genero
FROM actores a
JOIN reparto r ON a.idActor = r.idActor
JOIN contenido c ON r.idContenido = c.idContenido
JOIN categorias cat ON c.idCategoria = cat.idCategoria
JOIN generos g ON c.idGenero = g.idGenero;


SELECT 
  UPPER(c.titulo) AS titulo,
  UPPER(g.nombreGenero) AS genero,
  GROUP_CONCAT(DISTINCT t.nombreTag SEPARATOR ', ') AS tags,
  c.trailer
FROM contenido c
JOIN categorias cat ON c.idCategoria = cat.idCategoria
JOIN generos g ON c.idGenero = g.idGenero
LEFT JOIN contenido_tags ct ON c.idContenido = ct.idContenido
LEFT JOIN tags t ON ct.idTags = t.idTags
WHERE cat.nombreCategoria = 'Película'
GROUP BY c.idContenido;


SELECT 
  UPPER(c.titulo) AS titulo,
  UPPER(g.nombreGenero) AS genero,
  GROUP_CONCAT(DISTINCT t.nombreTag SEPARATOR ', ') AS tags,
  c.temporadas,
  c.trailer,
  c.resumen
FROM contenido c
JOIN categorias cat ON c.idCategoria = cat.idCategoria
JOIN generos g ON c.idGenero = g.idGenero
LEFT JOIN contenido_tags ct ON c.idContenido = ct.idContenido
LEFT JOIN tags t ON ct.idTags = t.idTags
WHERE cat.nombreCategoria = 'Serie'
GROUP BY c.idContenido;


-- Más actores
SELECT c.titulo, COUNT(r.idActor) AS cantidad_actores
FROM contenido c
JOIN reparto r ON c.idContenido = r.idContenido
GROUP BY c.idContenido
ORDER BY cantidad_actores DESC
LIMIT 1;

-- Menos actores
SELECT c.titulo, COUNT(r.idActor) AS cantidad_actores
FROM contenido c
JOIN reparto r ON c.idContenido = r.idContenido
GROUP BY c.idContenido
ORDER BY cantidad_actores ASC
LIMIT 1;



SELECT COUNT(*) AS cantidad_peliculas
FROM contenido c
JOIN categorias cat ON c.idCategoria = cat.idCategoria
WHERE cat.nombreCategoria = 'Película';


SELECT COUNT(*) AS cantidad_series
FROM contenido c
JOIN categorias cat ON c.idCategoria = cat.idCategoria
WHERE cat.nombreCategoria = 'Serie';


SELECT c.titulo, c.temporadas
FROM contenido c
JOIN categorias cat ON c.idCategoria = cat.idCategoria
WHERE cat.nombreCategoria = 'Serie'
ORDER BY c.temporadas DESC;


-- Agrega columna
ALTER TABLE contenido ADD COLUMN fecha_lanzamiento DATE;

-- Actualiza fechas para contenido de género "Aventura"
UPDATE contenido c
JOIN generos g ON c.idGenero = g.idGenero
SET c.fecha_lanzamiento = '2020-01-01'
WHERE g.nombreGenero = 'Aventura';


SELECT c.titulo, c.resumen
FROM contenido c
JOIN categorias cat ON c.idCategoria = cat.idCategoria
WHERE cat.nombreCategoria = 'Película'
  AND (
    c.titulo LIKE '%aventura%' OR
    c.resumen LIKE '%aventura%' OR
    c.titulo LIKE '%madre%' OR
    c.resumen LIKE '%madre%' OR
    c.titulo LIKE '%ambientada%' OR
    c.resumen LIKE '%ambientada%'
  );


-- Trabajos por actor
SELECT 
  a.nombreActor,
  COUNT(r.idContenido) AS cantidad_trabajos
FROM actores a
JOIN reparto r ON a.idActor = r.idActor
GROUP BY a.idActor
ORDER BY cantidad_trabajos DESC;

-- UNION películas y series
SELECT c.titulo, cat.nombreCategoria
FROM contenido c
JOIN categorias cat ON c.idCategoria = cat.idCategoria
WHERE cat.nombreCategoria = 'Película'
UNION
SELECT c.titulo, cat.nombreCategoria
FROM contenido c
JOIN categorias cat ON c.idCategoria = cat.idCategoria
WHERE cat.nombreCategoria = 'Serie';



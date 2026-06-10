-- 16. Fechas distintas de facturas de clientes con código < 50
SELECT DISTINCT fecha
FROM facturas
WHERE codcli < 50;

-- 17. Facturas de junio de 2004
SELECT codfac, fecha
FROM facturas
WHERE fecha BETWEEN DATE '2004-06-01' AND DATE '2004-06-30';

-- 18. Facturas de junio de 2004 para clientes entre 100 y 250
SELECT codfac, fecha
FROM facturas
WHERE codcli BETWEEN 100 AND 250
  AND fecha BETWEEN DATE '2004-06-01' AND DATE '2004-06-30';

-- 19. Facturas sin iva (cero o nulo) de clientes entre 90 y 100
SELECT codfac, fecha
FROM facturas
WHERE codcli BETWEEN 90 AND 100
  AND (iva = 0 OR iva IS NULL);

-- 20. Provincias que terminan en 's'
SELECT nombre
FROM provincias
WHERE UPPER(nombre) LIKE '%S';

-- 21. Clientes cuyo CP empieza por '02', '11' o '21'
SELECT nombre
FROM clientes
WHERE codpostal LIKE '02%'
   OR codpostal LIKE '11%'
   OR codpostal LIKE '21%';

-- 22. Artículos con stock > stock_min y stock <= stock_min + 5
SELECT *
FROM articulos
WHERE stock > stock_min
  AND stock - stock_min <= 5;

-- 23. Provincias que contienen 'MA'
SELECT nombre
FROM provincias
WHERE UPPER(nombre) LIKE '%MA%';

-- 24. Artículos en promoción (precio > 6000 y stock > 60000)
SELECT codart,
       descrip,
       precio AS precio_actual,
       precio * 0.9 AS precio_promocion
FROM articulos
WHERE precio > 6000
  AND stock > 60000;

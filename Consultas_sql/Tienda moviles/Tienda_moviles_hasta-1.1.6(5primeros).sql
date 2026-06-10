-- 1.1.3
-- 1
SELECT nombre FROM producto;

-- 2
SELECT nombre, precio FROM producto;

-- 3
SELECT * FROM producto;

-- 4
SELECT nombre, precio, precio * 1.08 AS usd FROM producto;

-- 5
SELECT nombre AS 'nombre de producto',
       precio AS euros,
       precio * 1.08 AS dólares
FROM producto;

-- 6
SELECT UPPER(nombre), precio FROM producto;

-- 7
SELECT LOWER(nombre), precio FROM producto;

-- 8
SELECT nombre, UPPER(LEFT(nombre,2)) FROM fabricante;

-- 9
SELECT nombre, ROUND(precio) FROM producto;

-- 10
SELECT nombre, TRUNCATE(precio,0) FROM producto;

-- 11
SELECT id_fabricante FROM producto;

-- 12
SELECT DISTINCT id_fabricante FROM producto;

-- 13
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- 14
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- 15
SELECT nombre, precio
FROM producto
ORDER BY nombre ASC, precio DESC;

-- 16
SELECT * FROM fabricante LIMIT 5;

-- 17
SELECT * FROM fabricante LIMIT 3, 2;

-- 18
SELECT nombre, precio
FROM producto
ORDER BY precio ASC
LIMIT 1;

-- 19
SELECT nombre, precio
FROM producto
ORDER BY precio DESC
LIMIT 1;

-- 20
SELECT nombre FROM producto WHERE id_fabricante = 2;

-- 21
SELECT nombre FROM producto WHERE precio <= 120;

-- 22
SELECT nombre FROM producto WHERE precio >= 400;

-- 23
SELECT nombre FROM producto WHERE precio < 400);

-- 24
SELECT nombre FROM producto
WHERE precio >= 80 AND precio <= 300;

-- 25
SELECT nombre FROM producto
WHERE precio BETWEEN 60 AND 200;

-- 26
SELECT nombre FROM producto
WHERE precio > 200 AND id_fabricante = 6;

-- 27
SELECT nombre FROM producto
WHERE id_fabricante = 1
   OR id_fabricante = 3
   OR id_fabricante = 5;

-- 28
SELECT nombre FROM producto
WHERE id_fabricante IN (1,3,5);

-- 29
SELECT nombre, precio * 100 AS céntimos
FROM producto;

-- 30
SELECT nombre FROM fabricante
WHERE nombre LIKE 'S%';

-- 31
SELECT nombre FROM fabricante
WHERE nombre LIKE '%e';

-- 32
SELECT nombre FROM fabricante
WHERE nombre LIKE '%w%';

-- 33
SELECT nombre FROM fabricante
WHERE LENGTH(nombre) = 4;

-- 34
SELECT nombre FROM producto
WHERE nombre LIKE '%Portátil%';

-- 35
SELECT nombre FROM producto
WHERE nombre LIKE '%Monitor%'
  AND precio < 215;

-- 36
SELECT nombre, precio
FROM producto
WHERE precio >= 180
ORDER BY precio DESC, nombre ASC;

-- 1.1.4
-- 1 
SELECT p.nombre, p.precio, f.nombre
FROM producto p, fabricante f
WHERE p.id_fabricante = f.id;

-- 1 
SELECT p.nombre, p.precio, f.nombre
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id;


-- 2 
SELECT p.nombre, p.precio, f.nombre
FROM producto p, fabricante f
WHERE p.id_fabricante = f.id
ORDER BY f.nombre;

-- 2 
SELECT p.nombre, p.precio, f.nombre
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id
ORDER BY f.nombre;


-- 3 
SELECT p.id, p.nombre, f.id, f.nombre
FROM producto p, fabricante f
WHERE p.id_fabricante = f.id;

-- 3 
SELECT p.id, p.nombre, f.id, f.nombre
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id;


-- 4 
SELECT p.nombre, p.precio, f.nombre
FROM producto p, fabricante f
WHERE p.id_fabricante = f.id
ORDER BY p.precio ASC
LIMIT 1;

-- 4 
SELECT p.nombre, p.precio, f.nombre
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id
ORDER BY p.precio ASC
LIMIT 1;


-- 5 
SELECT p.nombre, p.precio, f.nombre
FROM producto p, fabricante f
WHERE p.id_fabricante = f.id
ORDER BY p.precio DESC
LIMIT 1;

SELECT p.nombre
FROM producto p
ORDER BY p.precio ASC;

-- 5 
SELECT p.nombre, p.precio, f.nombre
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id
ORDER BY p.precio DESC
LIMIT 1;


-- 6 
SELECT p.*
FROM producto p, fabricante f
WHERE p.id_fabricante = f.id
  AND f.nombre = 'Lenovo';

-- 6 
SELECT p.*
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id
WHERE f.nombre = 'Lenovo';


-- 7 
SELECT p.*
FROM producto p, fabricante f
WHERE p.id_fabricante = f.id
  AND f.nombre = 'Crucial'
  AND p.precio > 200;

-- 7 
SELECT p.*
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id
WHERE f.nombre = 'Crucial'
  AND p.precio > 200;


-- 8 
SELECT p.*
FROM producto p, fabricante f
WHERE p.id_fabricante = f.id
  AND (f.nombre = 'Asus'
       OR f.nombre = 'Hewlett-Packard'
       OR f.nombre = 'Seagate');

-- 8 
SELECT p.*
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id
WHERE f.nombre IN ('Asus','Hewlett-Packard','Seagate');


-- 9 
SELECT p.*
FROM producto p, fabricante f
WHERE p.id_fabricante = f.id
  AND f.nombre IN ('Asus','Hewlett-Packard','Seagate');

-- 9 
SELECT p.*
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id
WHERE f.nombre IN ('Asus','Hewlett-Packard','Seagate');


-- 10 
SELECT p.nombre, p.precio
FROM producto p, fabricante f
WHERE p.id_fabricante = f.id
  AND UPPER(f.nombre) LIKE '%e';

-- 10 
SELECT p.nombre, p.precio
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id
WHERE f.nombre LIKE '%e';


-- 11 
SELECT p.nombre, p.precio
FROM producto p, fabricante f
WHERE p.id_fabricante = f.id
  AND f.nombre LIKE '%w%';

-- 11 
SELECT p.nombre, p.precio
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id
WHERE f.nombre LIKE '%w%';


-- 12 
SELECT p.nombre, p.precio, f.nombre
FROM producto p, fabricante f
WHERE p.id_fabricante = f.id
  AND p.precio >= 180
ORDER BY p.precio DESC, p.nombre ASC;

-- 12 
SELECT p.nombre, p.precio, f.nombre
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id
WHERE p.precio >= 180
ORDER BY p.precio DESC, p.nombre ASC;


-- 13 
SELECT DISTINCT f.id, f.nombre
FROM fabricante f, producto p
WHERE f.id = p.id_fabricante;

-- 13 
SELECT DISTINCT f.id, f.nombre
FROM fabricante f
JOIN producto p ON f.id = p.id_fabricante;

-- 1.1.5
-- 1
SELECT f.nombre AS fabricante, p.nombre AS producto
FROM fabricante f
LEFT JOIN producto p ON f.id = p.id_fabricante;

-- 2
SELECT f.nombre
FROM fabricante f
LEFT JOIN producto p ON f.id = p.id_fabricante
WHERE p.id IS NULL;


-- 1.1.6
-- 1
SELECT COUNT(*) FROM producto;

-- 2
SELECT COUNT(*) FROM fabricante;

-- 3 
SELECT COUNT(DISTINCT id_fabricante) FROM producto;

-- 4
SELECT AVG(IFNULL(precio, 0)) FROM producto;

-- 5
SELECT MIN(precio) FROM producto;

-- 6
SELECT MAX(precio) FROM producto;

-- 7
SELECT nombre, precio 
FROM producto 
ORDER BY precio ASC 
LIMIT 1;

-- 8
SELECT nombre, precio 
FROM producto 
ORDER BY precio DESC 
LIMIT 1;

-- 9. Calcula la suma de los precios de todos los productos
SELECT SUM(precio) FROM producto;

-- 10. Calcula el número de productos que tiene el fabricante Asus
SELECT COUNT(*)
FROM producto p, fabricante f
WHERE p.id_fabricante = f.id AND f.nombre LIKE 'Asus';

-- 11. Calcula la media del precio de todos los productos del fabricante Asus
SELECT AVG(IFNULL(p.precio,0))
FROM producto p, fabricante f
WHERE p.id_fabricante = f.id
  AND f.nombre LIKE 'Asus';

-- 12. Calcula el precio más barato de todos los productos del fabricante Asus
SELECT MIN(p.precio)
FROM producto p, fabricante f
WHERE p.id_fabricante = f.id
  AND f.nombre LIKE 'Asus';

-- 13. Calcula el precio más caro de todos los productos del fabricante Asus
SELECT MAX(p.precio)
FROM producto p, fabricante f
WHERE p.id_fabricante = f.id
  AND f.nombre LIKE 'Asus';

-- 14. Calcula la suma de todos los productos del fabricante Asus
SELECT SUM(p.precio)
FROM producto p, fabricante f
WHERE p.id_fabricante = f.id
  AND f.nombre LIKE 'Asus';

-- 15. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial
SELECT MAX(p.precio), MIN(p.precio), AVG(p.precio), COUNT(*)
FROM producto p, fabricante f
WHERE p.id_fabricante = f.id
  AND f.nombre LIKE 'Crucial';

/* 16. Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe
incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el
nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendente-
mente por el número de productos */
SELECT f.nombre, COUNT(p.id) AS total
FROM fabricante f
LEFT JOIN producto p ON f.id = p.id_fabricante
GROUP BY f.nombre
ORDER BY total DESC; -- left join para que me muestre lo de la tabla de la izquierda aunque no tenga valores asociados en la tabla de la derecha




/* 17. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes.
El resultado mostrará el nombre del fabricante junto con los datos que se solicitan */
SELECT f.nombre,
       MAX(p.precio),
       MIN(p.precio),
       AVG(IFNULL(p.precio, 0))
FROM fabricante f JOIN producto p 
ON f.id = p.id_fabricante
GROUP BY f.nombre;

/* 18. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes
que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el
identificador del fabricante es suficiente */
SELECT p.id_fabricante, MAX(p.precio), MIN(p.precio), AVG(p.precio), COUNT(*)
FROM producto p
GROUP BY p.id_fabricante
HAVING AVG(IFNULL(p.precio, 0)) > 200;


/* 19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el
número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario
mostrar el nombre del fabricante */
SELECT f.nombre,
       MAX(p.precio),
       MIN(p.precio),
       AVG(IFNULL(p.precio,0)),
       COUNT(*)
FROM fabricante f
JOIN producto p ON f.id = p.id_fabricante
GROUP BY f.nombre
HAVING AVG(IFNULL(p.precio,0)) > 200;

-- 20. Calcula el número de productos que tienen un precio mayor o igual a 180€
SELECT COUNT(*)
FROM producto p
WHERE p.precio >= 180;

-- 21. Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€
SELECT f.nombre, COUNT(p.id) AS total
FROM fabricante f, producto p
WHERE f.id = p.id_fabricante
  AND p.precio >= 180
GROUP BY f.nombre;

-- 22. Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabricante
SELECT id_fabricante, AVG(IFNULL(precio,0))
FROM producto
GROUP BY id_fabricante;

-- 23. Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante
SELECT f.nombre, AVG(IFNULL(p.precio,0))
FROM fabricante f, producto p
WHERE f.id = p.id_fabricante
GROUP BY f.nombre;

-- 24. Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€
SELECT f.nombre
FROM fabricante f, producto p
WHERE f.id = p.id_fabricante
GROUP BY f.nombre
HAVING AVG(IFNULL(p.precio,0)) >= 150;

-- 25. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos
SELECT f.nombre
FROM fabricante f, producto p
WHERE f.id = p.id_fabricante
GROUP BY f.nombre
HAVING COUNT(*) >= 2;

/* 26. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con
un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen
productos que cumplan la condición. */
SELECT f.nombre, COUNT(p.id) AS total
FROM fabricante f, producto p
WHERE f.id = p.id_fabricante
  AND p.precio >= 220
GROUP BY f.nombre;


/* 27. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con
un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si
hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el
listado con un valor igual a 0 en el número de productos */
SELECT f.nombre, COUNT(p.id) AS total
FROM fabricante f
LEFT JOIN producto p ON f.id = p.id_fabricante
AND p.precio >= 220
GROUP BY f.nombre
ORDER BY total DESC;

-- 28. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos ES SUPERIOR A 1000€
SELECT f.nombre
FROM fabricante f, producto p
WHERE f.id = p.id_fabricante
GROUP BY f.nombre
HAVING SUM(p.precio) > 1000;

/* 29. Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe
tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar
ordenado alfabéticamente de menor a mayor por el nombre del fabricante */
SELECT p.nombre AS producto,
       p.precio,
       f.nombre AS fabricante
FROM producto p, fabricante f
WHERE p.id_fabricante = f.id
  AND p.precio = (
        SELECT MAX(p2.precio)
        FROM producto p2
        WHERE p2.id_fabricante = f.id
  )
ORDER BY f.nombre;


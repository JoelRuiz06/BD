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
WHERE precio = (SELECT MIN(precio) FROM producto);

-- 8
SELECT nombre, precio
FROM producto
WHERE precio = (SELECT MAX(precio) FROM producto);

-- 9. Calcula la suma de los precios de todos los productos
SELECT SUM(precio) FROM producto;

-- 10. Calcula el número de productos que tiene el fabricante Asus
SELECT COUNT(*)
FROM producto p, fabricante f
WHERE p.id_fabricante = f.id AND f.nombre LIKE 'Asus';

-- 11. Calcula la media del precio de todos los productos del fabricante Asus
SELECT AVG(p.precio)
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
ORDER BY total DESC;


/* 17. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes.
El resultado mostrará el nombre del fabricante junto con los datos que se solicitan */
SELECT f.nombre,
       MAX(p.precio),
       MIN(p.precio),
       AVG(p.precio)
FROM fabricante f
LEFT JOIN producto p ON f.id = p.id_fabricante
GROUP BY f.nombre;

/* 18. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes
que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el
identificador del fabricante es suficiente */
SELECT p.id_fabricante, MAX(p.precio), MIN(p.precio), AVG(p.precio), COUNT(*)
FROM producto p
GROUP BY p.id_fabricante
HAVING AVG(p.precio) > 200;


/* 19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el
número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario
mostrar el nombre del fabricante */
SELECT f.nombre,
       MAX(p.precio),
       MIN(p.precio),
       AVG(p.precio),
       COUNT(*)
FROM fabricante f
JOIN producto p ON f.id = p.id_fabricante
GROUP BY f.nombre
HAVING AVG(p.precio) > 200;

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
SELECT id_fabricante, AVG(precio)
FROM producto
GROUP BY id_fabricante;

-- 23. Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante
SELECT f.nombre, AVG(p.precio)
FROM fabricante f, producto p
WHERE f.id = p.id_fabricante
GROUP BY f.nombre;

-- 24. Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€
SELECT f.nombre
FROM fabricante f, producto p
WHERE f.id = p.id_fabricante
GROUP BY f.nombre
HAVING AVG(p.precio) >= 150;

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
SELECT f.nombre, SUM(p.precio) AS suma
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


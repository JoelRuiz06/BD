-- 1. Código, fecha y doble del descuento de las facturas con iva cero
SELECT codfac, fecha, dto * 2 AS doble_dto
FROM facturas
WHERE iva = 0;

-- 2. Código de las facturas con iva nulo
SELECT codfac
FROM facturas
WHERE iva IS NULL;

-- 3. Código y fecha de las facturas sin iva (cero o nulo)
SELECT codfac, fecha
FROM facturas
WHERE iva = 0 OR iva IS NULL; --where nvl(iva,0)=0

-- 4. Líneas con cantidad < 5 y descuento >= 25%
SELECT codfac, codart
FROM lineas_fac
WHERE cant < 5
  AND dto >= 25;

-- 5. Artículos con stock por debajo del mínimo y unidades necesarias
SELECT descrip,
       (stock_min - stock) AS unidades_necesarias
FROM articulos
WHERE stock < stock_min;

-- 6. Ivas distintos aplicados a las facturas
SELECT DISTINCT iva
FROM facturas;

-- 7. Artículos con stock nulo
SELECT codart, descrip, stock_min
FROM articulos
WHERE stock IS NULL;

-- 8. Artículos con stock > 3*stock_min y precio > 6
SELECT descrip
FROM articulos
WHERE stock > 3 * stock_min
  AND precio > 6;

-- 9. Artículos distintos comprados en facturas entre 8 y 10
SELECT DISTINCT codart
FROM lineas_fac
WHERE codfac BETWEEN 8 AND 10;

-- 10. Nombre y dirección de todos los clientes
SELECT nombre, direccion
FROM clientes;

-- 11. Códigos de pueblos donde tenemos clientes
SELECT DISTINCT codpue
FROM clientes;

-- 12. Códigos de pueblos con clientes cuyo código < 25
SELECT DISTINCT codpue
FROM clientes
WHERE codcli < 25;

-- 13. Provincias cuya segunda letra es 'O'
SELECT nombre
FROM provincias
WHERE UPPER(nombre) LIKE '_0%'; --(SUBSTR(nombre, 2, 1)) = 'O';

-- 14. Facturas del año pasado para clientes con código entre 50 y 100
SELECT codfac, fecha
FROM facturas
WHERE codcli BETWEEN 50 AND 100
  AND EXTRACT(YEAR FROM fecha) = EXTRACT(YEAR FROM SYSDATE) - 1;

-- 15. Clientes cuyo código postal empieza por '12'
SELECT nombre, direccion
FROM clientes
WHERE codpostal LIKE '12%';
-- 1. Descuento medio aplicado en las facturas 
SELECT AVG(NVL(dto,0)) FROM FACTURAS f;

-- 2. Descuento medio aplicado en las facturas sin considerar los valores nulos 
SELECT AVG(dto) FROM FACTURAS f;

-- 3. Descuento medio aplicado en las facturas considerando los valores nulos como cero 
SELECT AVG(NVL(dto,0)) FROM FACTURAS f;

-- 4. Número de facturas 
SELECT COUNT(*) FROM FACTURAS f;

-- 5. Número de pueblos de la Comunidad de Valencia 
SELECT COUNT(P.CODPUE) FROM PUEBLOS p, PROVINCIAS p2
WHERE P.CODPRO = P2.CODPRO AND P2.NOMBRE IN ('VALENCIA','CASTELLON','ALICANTE');

/* 6. Importe total de los artículos que tenemos en el almacén. Este importe se calcula sumando el
producto de las unidades en stock por el precio de cada unidad */
SELECT SUM(A.PRECIO * A.STOCK) FROM ARTICULOS a;

-- 7. Número de pueblos en los que residen clientes cuyo código postal empieza por ‘12’ 
SELECT COUNT(DISTINCT P.CODPUE) FROM CLIENTES c, PUEBLOS p 
WHERE C.CODPUE = P.CODPUE AND C.CODPOSTAL LIKE '12%';

/* 8. Valores máximo y mínimo del stock de los artículos cuyo precio oscila entre 9 y 12 € y diferencia
entre ambos valores */
SELECT MAX(STOCK), MIN(STOCK),
MAX(STOCK) - MIN(STOCK) AS DIFERENCIA
FROM ARTICULOS
WHERE PRECIO BETWEEN 9 AND 12;

-- 9. Precio medio de los artículos cuyo stock supera las 10 unidades 
SELECT AVG(NVL(A.PRECIO,0)) FROM ARTICULOS a 
WHERE A.STOCK > 10;

-- 10. Fecha de la primera y la última factura del cliente con código 210 
SELECT MIN(FECHA), MAX(FECHA) FROM FACTURAS
WHERE CODCLI = 210;

-- 11. Número de artículos cuyo stock es nulo 
SELECT COUNT(*) FROM ARTICULOS a WHERE a.STOCK IS NULL;

-- 12. Número de líneas cuyo descuento es nulo (con un decimal)
SELECT TO_CHAR(COUNT(*), '99990.0') FROM LINEAS_FAC WHERE DTO IS NULL;

-- 13. Obtener cuántas facturas tiene cada cliente 
SELECT C.CODCLI, COUNT(F.CODCLI) 
FROM FACTURAS f, CLIENTES c
WHERE F.CODCLI = C.CODCLI
GROUP BY C.CODCLI;

-- 14. Obtener cuántas facturas tiene cada cliente, pero sólo si tiene dos o más facturas
SELECT COUNT(F.CODFAC)
FROM FACTURAS f 
GROUP BY F.CODCLI
HAVING COUNT(*)>=2;

/* 15. Importe de la facturación (suma del producto de la cantidad por el precio de las líneas de
factura) de los artículos */
SELECT SUM(CANT * PRECIO)
FROM LINEAS_FAC;

/* 16. Importe de la facturación (suma del producto de la cantidad por el precio de las líneas de
factura) de aquellos artículos cuyo código contiene la letra “A” (bien mayúscula o minúscula) */
SELECT LF.codart, SUM(LF.cant * LF.precio)
FROM lineas_fac LF, ARTICULOS a 
WHERE UPPER(A.CODART) LIKE '%A%' AND A.CODART = LF.CODART
GROUP BY LF.codart;

-- 17. Número de facturas para cada fecha, junto con la fecha
SELECT COUNT(CODFAC), FECHA
FROM FACTURAS
GROUP BY FECHA;

/* 18. Obtener el número de clientes del pueblo junto con el nombre del pueblo mostrando primero los
pueblos que más clientes tengan */
SELECT COUNT(C.CODCLI), P.NOMBRE
FROM CLIENTES c, PUEBLOS p
WHERE C.CODPUE = P.CODPUE
GROUP BY P.NOMBRE
ORDER BY COUNT(C.CODCLI) DESC;

/* 19. Obtener el número de clientes del pueblo junto con el nombre del pueblo mostrando primero los
pueblos que más clientes tengan, siempre y cuando tengan más de dos clientes */
SELECT COUNT(C.CODCLI), P.NOMBRE
FROM CLIENTES c, pueblos p
WHERE C.CODPUE = P.CODPUE
GROUP BY P.NOMBRE
HAVING COUNT(C.CODCLI) > 2
ORDER BY COUNT(C.CODCLI) DESC; 

/* 20. Cantidades totales vendidas para cada artículo cuyo código empieza por “P", mostrando también
la descripción de dicho artículo */
SELECT A.DESCRIP, SUM(LF.CANT)
FROM LINEAS_FAC lf, ARTICULOS a
WHERE LF.CODART = A.CODART
  AND A.CODART LIKE 'P%'
GROUP BY A.DESCRIP;

/* 20 EXTENDIDO. Precio máximo y precio mínimo de venta (en líneas defacturas) para cada artículo cuyo 
código empieza por “c” */
SELECT MAX(LF.PRECIO), MIN(LF.PRECIO)
FROM LINEAS_FAC lf 
WHERE LF.CODART LIKE 'C%'
GROUP BY LF.CODART;

-- 21. Igual que el anterior (22 NORMAL) pero mostrando también la diferencia entre el precio máximo y mínimo 
SELECT SUM(LF.CANT), A.DESCRIP, (MAX(LF.PRECIO) - MIN(LF.PRECIO)) AS DIFERENCIA
FROM LINEAS_FAC lf, ARTICULOS a
WHERE LF.CODART = A.CODART AND A.CODART LIKE 'P%'
GROUP BY A.CODART, A.DESCRIP;

-- 22. Nombre de aquellos artículos de los que se ha facturado más de 10000 euros 
SELECT A.DESCRIP
FROM ARTICULOS a, LINEAS_FAC lf,FACTURAS f
WHERE A.CODART = LF.CODART AND LF.CODFAC = F.CODFAC
GROUP BY A.DESCRIP
HAVING SUM(LF.CANT * LF.PRECIO) > 10000;

/* 23. Número de facturas de cada uno de los clientes cuyo código está entre 150 y 300 (se debe
mostrar este código), con cada IVA distinto que se les ha aplicado  */
SELECT F.CODCLI, F.IVA, COUNT(*)
FROM facturas f
WHERE F.CODCLI BETWEEN 150 AND 300
GROUP BY F.CODCLI, F.IVA;

-- 24. Media del importe de las facturas, sin tener en cuenta impuestos ni descuentos 
SELECT AVG(NVL(SUM(CANT * PRECIO),0)) AS MEDIA
FROM LINEAS_FAC lf
GROUP BY CODFAC;


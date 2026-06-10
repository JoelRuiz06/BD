--1
SELECT c.nombre, p.nombre
FROM clientes c, pueblos p
WHERE c.codpue = p.codpue;

--2
SELECT p.nombre, pr.nombre
FROM pueblos p, provincias pr
WHERE p.codpro = pr.codpro;

--3
SELECT c.nombre, p.nombre, pr.nombre
FROM clientes c, pueblos p, provincias pr
WHERE c.codpue = p.codpue
  AND p.codpro = pr.codpro;

--4
SELECT DISTINCT pr.nombre
FROM clientes c, pueblos p, provincias pr
WHERE c.codpue = p.codpue
  AND p.codpro = pr.codpro;

--5
SELECT DISTINCT a.descrip
FROM articulos a, lineas_fac l
WHERE a.codart = l.codart
  AND l.cantidad > 10;

--6
SELECT f.fecha, l.codart, l.cantidad
FROM facturas f, lineas_fac l
WHERE f.codfac = l.codfac
ORDER BY f.fecha DESC, l.codart, l.cantidad DESC;


--7
SELECT f.codfac, f.fecha
FROM facturas f, clientes c
WHERE f.codcli = c.codcli
  AND c.codpos LIKE '%7%';

--8
SELECT f.codfac, f.fecha, c.nombre
FROM facturas f, clientes c
WHERE f.codcli = c.codcli;

--9
SELECT f.codfac, f.fecha, f.iva, f.dto, c.nombre
FROM facturas f, clientes c
WHERE f.codcli = c.codcli
  AND (f.iva IS NULL OR f.iva = 0 OR f.dto IS NULL);

--10
SELECT a.descrip, a.precio AS precio_actual, l.precio AS precio_vendido
FROM articulos a, lineas_fac l
WHERE a.codart = l.codart
  AND l.precio < a.precio;

--11
SELECT f.codfac, f.fecha, f.iva, f.dto,
       a.descrip, l.precio, l.cantidad, l.dto
FROM facturas f, lineas_fac l, articulos a
WHERE f.codfac = l.codfac
  AND l.codart = a.codart;


--12
SELECT f.codfac, f.fecha, f.iva, f.dto,
       c.nombre, a.descrip, l.precio, l.cantidad, l.dto
FROM facturas f, clientes c, lineas_fac l, articulos a
WHERE f.codcli = c.codcli
  AND f.codfac = l.codfac
  AND l.codart = a.codart;


--13
SELECT DISTINCT c.nombre
FROM clientes c, pueblos p, provincias pr
WHERE c.codpue = p.codpue
  AND p.codpro = pr.codpro
  AND LOWER(pr.nombre) LIKE '%ma%';


--14
SELECT DISTINCT f.codcli
FROM facturas f, lineas_fac l, articulos a
WHERE f.codfac = l.codfac
  AND l.codart = a.codart
  AND a.stock < a.stock_min;


--15
SELECT DISTINCT a.descrip
FROM articulos a, lineas_fac l
WHERE a.codart = l.codart;


--16
SELECT a.descrip,
       l.precio - (l.precio * l.dto / 100) AS precio_real
FROM articulos a, lineas_fac l
WHERE a.codart = l.codart;

--17
SELECT DISTINCT a.descrip
FROM articulos a, lineas_fac l, facturas f, clientes c, pueblos p, provincias pr
WHERE a.codart = l.codart
  AND l.codfac = f.codfac
  AND f.codcli = c.codcli
  AND c.codpue = p.codpue
  AND p.codpro = pr.codpro
  AND LOWER(pr.nombre) LIKE '%a';

--18
SELECT DISTINCT c.nombre
FROM clientes c, facturas f
WHERE c.codcli = f.codcli
  AND f.dto > 10;

--19
SELECT DISTINCT c.nombre
FROM clientes c, facturas f, lineas_fac l
WHERE c.codcli = f.codcli
  AND f.codfac = l.codfac
  AND (f.dto > 10 OR l.dto > 10);

--20
SELECT a.descrip, l.cantidad, l.precio
FROM articulos a, lineas_fac l, facturas f, clientes c
WHERE a.codart = l.codart
  AND l.codfac = f.codfac
  AND f.codcli = c.codcli
  AND UPPER(c.nombre) = 'MARIA MERCEDES';


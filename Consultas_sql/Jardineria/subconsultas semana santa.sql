-- 1
SELECT nombre_cliente
FROM cliente
WHERE limite_credito = (
    SELECT MAX(limite_credito)
    FROM cliente
);

-- 2
SELECT nombre
FROM producto
WHERE precio_venta = 
(SELECT MAX(precio_venta)
   FROM producto
);

-- 3
SELECT p.nombre
FROM producto p
JOIN detalle_pedido d 
    ON p.codigo_producto = d.codigo_producto
GROUP BY p.codigo_producto
ORDER BY SUM(d.cantidad) DESC
LIMIT 1;

SELECT p.nombre FROM producto p
WHERE p.codigo_producto = (
    					 SELECT dp.codigo_producto FROM detalle_pedido dp
    					 GROUP BY dp.codigo_producto 
   						 ORDER BY SUM(dp.cantidad) DESC 
    					 LIMIT 1
);

-- 4
SELECT nombre_cliente
FROM cliente c
WHERE limite_credito > (
    SELECT IFNULL(SUM(total), 0)
    FROM pago p
    WHERE p.codigo_cliente = c.codigo_cliente
);

-- 5
SELECT nombre
FROM producto
WHERE cantidad_en_stock = (
    SELECT MAX(cantidad_en_stock)
    FROM producto
);

-- 6
SELECT nombre
FROM producto
WHERE cantidad_en_stock = (
    SELECT MIN(cantidad_en_stock)
    FROM producto
);

-- 7
SELECT nombre, apellido1, apellido2, email
FROM empleado
WHERE codigo_jefe = (
    SELECT codigo_empleado
    FROM empleado
    WHERE nombre = 'Alberto' 
      AND apellido1 = 'Soria'
);

-- 8
SELECT nombre_cliente
FROM cliente
WHERE limite_credito >= ALL (
    SELECT limite_credito FROM cliente
);

-- 9
SELECT nombre
FROM producto
WHERE precio_venta >= ALL (
    SELECT precio_venta FROM producto
);

-- 10
SELECT nombre
FROM producto
WHERE cantidad_en_stock <= ALL (
    SELECT cantidad_en_stock FROM producto
);

-- 11
SELECT nombre, apellido1, puesto
FROM empleado
WHERE codigo_empleado NOT IN (
    SELECT codigo_empleado_rep_ventas
    FROM cliente
    WHERE codigo_empleado_rep_ventas IS NOT NULL
);

-- 12
SELECT nombre_cliente
FROM cliente
WHERE codigo_cliente NOT IN (
    SELECT codigo_cliente FROM pago
);

-- 13
SELECT nombre_cliente
FROM cliente
WHERE codigo_cliente IN (
    SELECT codigo_cliente FROM pago
);

-- 14
SELECT nombre
FROM producto
WHERE codigo_producto NOT IN (
    SELECT codigo_producto FROM detalle_pedido
);

-- 15
SELECT e.nombre, e.apellido1, e.puesto, o.telefono
FROM empleado e
JOIN oficina o 
    ON e.codigo_oficina = o.codigo_oficina
WHERE e.codigo_empleado NOT IN (
    SELECT codigo_empleado_rep_ventas 
    FROM cliente
    WHERE codigo_empleado_rep_ventas IS NOT NULL
);

-- 16
SELECT codigo_oficina, ciudad
FROM oficina
WHERE codigo_oficina NOT IN (
    SELECT DISTINCT e.codigo_oficina
    FROM empleado e
    JOIN cliente c 
        ON e.codigo_empleado = c.codigo_empleado_rep_ventas
    JOIN pedido pe 
        ON c.codigo_cliente = pe.codigo_cliente
    JOIN detalle_pedido dp 
        ON pe.codigo_pedido = dp.codigo_pedido
    JOIN producto p 
        ON dp.codigo_producto = p.codigo_producto
    WHERE p.gama = 'Frutales'
);

-- 17
SELECT nombre_cliente
FROM cliente
WHERE codigo_cliente IN (
    SELECT codigo_cliente FROM pedido
)
AND codigo_cliente NOT IN (
    SELECT codigo_cliente FROM pago
);

-- 18
SELECT nombre_cliente
FROM cliente c
WHERE NOT EXISTS (
    SELECT 1
    FROM pago p
    WHERE p.codigo_cliente = c.codigo_cliente
);

-- 19
SELECT nombre_cliente
FROM cliente c
WHERE EXISTS (
    SELECT 1
    FROM pago p
    WHERE p.codigo_cliente = c.codigo_cliente
);

-- 20
SELECT nombre
FROM producto p
WHERE NOT EXISTS (
    SELECT 1
    FROM detalle_pedido d
    WHERE d.codigo_producto = p.codigo_producto
);

SELECT nombre
FROM producto p
LEFT JOIN detalle_pedido dp
ON dp.codigo_producto = p.codigo_producto
WHERE dp.codigo_pedido IS NULL;

-- 21
SELECT DISTINCT nombre
FROM producto p
WHERE EXISTS (
    SELECT 1
    FROM detalle_pedido d
    WHERE d.codigo_producto = p.codigo_producto
);
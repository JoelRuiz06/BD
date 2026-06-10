-- id de pedido, nombre y apellido de comercial de sev

SELECT p2.ID, c2.NOMBRE, c2.APELLIDO1, c2.APELLIDO2, c.CIUDAD
FROM pedido p2 , cliente c, comercial c2 
WHERE p2.ID =  
UPPER(ciudad) LIKE 'Sevilla';



-- SACAR PEDIDOS QUE NO TENGAN COMERCIAL

SELECT p2.ID, p2.id_comercial 
FROM pedido p2
WHERE p2.id_comercial IS NULL;
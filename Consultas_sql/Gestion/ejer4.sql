-- 1 
SELECT COUNT(c.codcli) FROM clientes c
JOIN FACTURAS f ON c.CODCLI =f.CODCLI 
WHERE f.IVA >= 16;


SELECT COUNT(c.codcli) FROM clientes c
WHERE c.CODCLI IN (SELECT f.CODCLI  FROM Facturas f
										WHERE f.IVA =16);

-- 2
SELECT COUNT(c.codcli) FROM clientes c
WHERE c.CODCLI IN (SELECT f.CODCLI  FROM Facturas f
										WHERE NVL(IVA,0) !=16);



-- 3
SELECT COUNT(*) FROM clientes c
WHERE c.codcli IN (
				  SELECT codcli FROM facturas
)AND c.codcli NOT IN (
				     SELECT codcli FROM facturas
				     WHERE iva<>16 OR iva IS NULL
);
																



-- 4
										
SELECT F.FECHA
FROM FACTURAS F
JOIN LINEAS_FAC lf ON LF.CODFAC = F.CODFAC 
GROUP BY F.CODFAC, F.FECHA 
HAVING SUM(LF.CANT*LF.PRECIO) =
		(SELECT max(sum(lf.CANT*lf.PRECIO))
		FROM LINEAS_FAC lf 
		GROUP BY lf.CODFAC);



-- 5
SELECT COUNT(*)
FROM pueblos p
LEFT JOIN clientes c ON c.codpue = p.codpue
WHERE c.codcli IS NULL;

-- 6. Artículos con stock > 20, precio > 15 y sin ventas en el último trimestre del año pasado
SELECT COUNT(*)
FROM ARTICULOS A
WHERE A.STOCK > 20
  AND A.PRECIO > 15
  AND A.CODART NOT IN (
        SELECT LF.CODART
        FROM LINEAS_FAC LF
        JOIN FACTURAS F ON F.CODFAC = LF.CODFAC
        WHERE EXTRACT(YEAR FROM F.FECHA) = EXTRACT(YEAR FROM SYSDATE) - 1
          AND EXTRACT(MONTH FROM F.FECHA) BETWEEN 10 AND 12
  );

-- 7. Número de clientes que en todas las facturas del año pasado han pagado IVA
SELECT COUNT(*)
FROM CLIENTES C
WHERE C.CODCLI IN (
    SELECT CODCLI
    FROM FACTURAS
    WHERE EXTRACT(YEAR FROM FECHA) = EXTRACT(YEAR FROM SYSDATE) - 1
    GROUP BY CODCLI
    HAVING MIN(NVL(IVA,0)) > 0
);

-- 8. Clientes preferentes en noviembre del año pasado y sin facturas en diciembre
SELECT CODCLI, NOMBRE
FROM CLIENTES
WHERE CODCLI IN (
    SELECT F.CODCLI
    FROM FACTURAS F
    JOIN LINEAS_FAC L ON L.CODFAC = F.CODFAC
    WHERE EXTRACT(YEAR FROM F.FECHA) = EXTRACT(YEAR FROM SYSDATE) - 1
      AND EXTRACT(MONTH FROM F.FECHA) = 11
    GROUP BY F.CODCLI
    HAVING SUM(L.CANT * L.PRECIO) > 60.50
)
AND CODCLI NOT IN (
    SELECT CODCLI
    FROM FACTURAS
    WHERE EXTRACT(YEAR FROM FECHA) = EXTRACT(YEAR FROM SYSDATE) - 1
      AND EXTRACT(MONTH FROM FECHA) = 12
);

-- 9. Código, descripción y precio de los diez artículos más caros
SELECT CODART, DESCRIP, PRECIO
FROM ARTICULOS
ORDER BY PRECIO DESC
FETCH FIRST 10 ROWS ONLY;

-- 10. Nombre de la provincia con mayor número de clientes
SELECT NOMBRE
FROM PROVINCIAS
WHERE CODPRO = (
    SELECT CODPRO
    FROM (
        SELECT P.CODPRO, COUNT(*) AS NUM
        FROM CLIENTES C
        JOIN PUEBLOS P ON P.CODPUE = C.CODPUE
        GROUP BY P.CODPRO
        ORDER BY NUM DESC
        FETCH FIRST 1 ROWS ONLY
    )
);

-- 11. Artículos con precio > 90.15 y vendidos menos de 10 unidades el año pasado
SELECT CODART, DESCRIP
FROM ARTICULOS A
WHERE A.PRECIO > 90.15
  AND (
        SELECT NVL(SUM(L.CANT), 0)
        FROM LINEAS_FAC L
        JOIN FACTURAS F ON F.CODFAC = L.CODFAC
        WHERE L.CODART = A.CODART
          AND EXTRACT(YEAR FROM F.FECHA) = EXTRACT(YEAR FROM SYSDATE) - 1
      ) < 10;

-- 12. Artículos cuyo precio es más de 3000 veces el precio mínimo
SELECT CODART, DESCRIP
FROM ARTICULOS
WHERE PRECIO > 3000 * (
    SELECT MIN(PRECIO) FROM ARTICULOS
);

-- 13. Nombre del cliente con mayor facturación
SELECT NOMBRE
FROM CLIENTES
WHERE CODCLI = (
    SELECT CODCLI
    FROM (
        SELECT F.CCODCLI AS CODCLI, SUM(L.CANT * L.PRECIO) AS TOTAL
        FROM FACTURAS F
        JOIN LINEAS_FAC L ON L.CODFAC = F.CODFAC
        GROUP BY F.CODCLI
        ORDER BY TOTAL DESC
        FETCH FIRST 1 ROWS ONLY
    )
);

-- 14. Artículos con precio superior a la media y comprados por más de 5 clientes
SELECT CODART, DESCRIP
FROM ARTICULOS A
WHERE A.PRECIO > (
        SELECT AVG(PRECIO) FROM ARTICULOS
)
AND (
        SELECT COUNT(DISTINCT F.CODCLI)
        FROM LINEAS_FAC L
        JOIN FACTURAS F ON F.CODFAC = L.CODFAC
        WHERE L.CODART = A.CODART
    ) > 5;

-- 11
SELECT *
FROM empleado E
LEFT JOIN departamento D
ON E.ID_departamento = D.ID;


SELECT *
FROM empleado E, departamento D
WHERE E.ID_departamento = D.ID
OR E.ID_departamento IS NULL;

-- 12
SELECT *
FROM empleado
WHERE ID_departamento IS NULL;


-- 13
SELECT *
FROM departamento D
LEFT JOIN empleado E
ON D.ID = E.ID_departamento
WHERE E.ID_departamento IS NULL;








-- 1. Mostrar el identificador de los alumnos matriculados en cualquier asignatura excepto la '150212' y la '130113'.
SELECT IDALUMNO
FROM ALUMNO_ASIGNATURA aa 
WHERE IDASIGNATURA NOT IN (
    SELECT IDASIGNATURA
    FROM ASIGNATURA
    WHERE IDASIGNATURA IN ('150212', '130113')
);

-- 2. Mostrar el nombre de las asignaturas que tienen más créditos que "Seguridad Vial".
SELECT NOMBRE
FROM ASIGNATURA a 
WHERE CREDITOS > (
    SELECT CREDITOS 
    FROM ASIGNATURA 
    WHERE NOMBRE LIKE 'Seguridad Vial'
);

-- 3. Obtener el Id de los alumnos matriculados en las asignaturas "150212" y "130113" a la vez.
SELECT IDALUMNO
FROM ALUMNO_ASIGNATURA
WHERE IDALUMNO IN (
    SELECT IDALUMNO
    FROM ALUMNO_ASIGNATURA
    WHERE IDASIGNATURA LIKE '150212'
)
AND IDALUMNO IN (
    SELECT IDALUMNO
    FROM ALUMNO_ASIGNATURA
    WHERE IDASIGNATURA LIKE '130113'
);

-- 4. Mostrar el Id de los alumnos matriculados en las asignatura "150212" ó "130113", en una o en otra pero no en ambas a la vez.
SELECT IDALUMNO
FROM ALUMNO_ASIGNATURA
WHERE IDASIGNATURA IN ('150212', '130113')
GROUP BY IDALUMNO
HAVING COUNT(DISTINCT IDASIGNATURA) = 1;

/* 5. Mostrar el nombre de las asignaturas de la titulación "130110" cuyos costes básicos sobrepasen el coste básico promedio por 
asignatura en esa titulación. */
SELECT NOMBRE
FROM ASIGNATURA a
WHERE IDTITULACION = '130110'
AND COSTEBASICO > (
    SELECT AVG(NVL(COSTEBASICO,0))
    FROM ASIGNATURA
    WHERE IDTITULACION = '130110'
);

-- 6. Mostrar el identificador de los alumnos matriculados en cualquier asignatura excepto la "150212" y la "130113”.
SELECT IDALUMNO
FROM ALUMNO_ASIGNATURA aa 
WHERE IDASIGNATURA NOT IN (
    SELECT IDASIGNATURA
    FROM ASIGNATURA
    WHERE IDASIGNATURA IN ('150212', '130113')
);

-- 7. Mostrar el Id de los alumnos matriculados en la asignatura "150212" pero no en la "130113".
SELECT IDALUMNO
FROM ALUMNO_ASIGNATURA
WHERE IDALUMNO IN (
    SELECT IDALUMNO
    FROM ALUMNO_ASIGNATURA
    WHERE IDASIGNATURA = '150212'
)
AND IDALUMNO NOT IN (
    SELECT IDALUMNO
    FROM ALUMNO_ASIGNATURA
    WHERE IDASIGNATURA = '130113'
);

-- 8. Mostrar el nombre de las asignaturas que tienen más créditos que "Seguridad Vial".
SELECT NOMBRE
FROM ASIGNATURA a 
WHERE CREDITOS > (
    SELECT CREDITOS 
    FROM ASIGNATURA 
    WHERE NOMBRE = 'Seguridad Vial'
);

-- 9. Mostrar las personas que no son ni profesores ni alumnos.
SELECT NOMBRE
FROM PERSONA p
WHERE DNI NOT IN (SELECT DNI FROM ALUMNO)
AND   DNI NOT IN (SELECT DNI FROM PROFESOR);

-- 10.Mostrar el nombre de las asignaturas que tengan más créditos.
SELECT NOMBRE
FROM ASIGNATURA
WHERE CREDITOS = (
    SELECT MAX(CREDITOS)
    FROM ASIGNATURA
);

-- 11.Lista de asignaturas en las que no se ha matriculado nadie.
SELECT NOMBRE
FROM ASIGNATURA a
WHERE IDASIGNATURA NOT IN (
    SELECT IDASIGNATURA
    FROM ALUMNO_ASIGNATURA
);

-- 12.Ciudades en las que vive algún profesor y también algún alumno.
SELECT CIUDAD
FROM PERSONA p
WHERE CIUDAD IN (
    SELECT CIUDAD
    FROM PERSONA
    WHERE DNI IN (SELECT DNI FROM PROFESOR)
)
AND CIUDAD IN (
    SELECT CIUDAD
    FROM PERSONA
    WHERE DNI IN (SELECT DNI FROM ALUMNO)
);

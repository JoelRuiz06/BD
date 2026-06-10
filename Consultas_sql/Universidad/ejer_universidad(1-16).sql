-- 16. Mostrar el nombre de todas las mujeres que viven en "Madrid".
SELECT NOMBRE
FROM PERSONA
WHERE CIUDAD = 'Madrid'
  AND VARON = 0;

-- 17. Mostrar el nombre y los teléfonos de aquellas personas cuyo teléfono empieza por 91
SELECT NOMBRE, TELEFONO
FROM PERSONA
WHERE TELEFONO LIKE '91%';

-- 18. Mostrar el nombre de las asignaturas que contengan la sílaba "pro"
SELECT NOMBRE
FROM ASIGNATURA
WHERE LOWER(NOMBRE) LIKE '%pro%';

-- 19. Mostrar el nombre de la asignatura de primero y que lo imparta el profesor que tiene código P101
SELECT NOMBRE
FROM ASIGNATURA
WHERE CURSO = 1
  AND IDPROFESOR = 'P101';

-- 20. Mostrar el código de alumno que se ha matriculado tres o más veces de una asignatura, mostrando también el código de la asignatura correspondiente.
SELECT IDALUMNO, IDASIGNATURA
FROM ALUMNO_ASIGNATURA
GROUP BY IDALUMNO, IDASIGNATURA
HAVING COUNT(*) >= 3;

-- 21. Mostrar nombre, precio básico y precios de repeticiones (10%, 30%, 60% más).
SELECT NOMBRE,
       COSTEBASICO,
       COSTEBASICO * 1.10,
       COSTEBASICO * 1.30,
       COSTEBASICO * 1.60
FROM ASIGNATURA;

-- 22. Mostrar todos los datos de las personas nacidas antes de la década de los 70.
SELECT *
FROM PERSONA
WHERE FECHA_NACIMIENTO < DATE '1970-01-01';

-- 23. Mostrar el identificador de las personas que trabajan como profesor, sin que salgan valores repetidos.
SELECT DISTINCT IDPROFESOR
FROM PROFESOR;

-- 24. Mostrar el identificador de los alumnos que se encuentran matriculados en la asignatura con código 130122.
SELECT IDALUMNO
FROM ALUMNO_ASIGNATURA
WHERE IDASIGNATURA = '130122';

-- 25. Mostrar los códigos de las asignaturas en las que se encuentra matriculado algún alumno, sin que salgan códigos repetidos.
SELECT DISTINCT IDASIGNATURA
FROM ALUMNO_ASIGNATURA;

-- 26. Mostrar el nombre de las asignaturas que tienen más de 4 créditos, y además, o se imparten en el primer cuatrimestre o son del primer curso.
SELECT NOMBRE
FROM ASIGNATURA
WHERE CREDITOS > 4
  AND (CUATRIMESTRE = 1 OR CURSO = 1);

-- 27. Mostrar los distintos códigos de las titulaciones en las que hay alguna asignatura en nuestra base de datos.
SELECT DISTINCT IDTITULACION
FROM ASIGNATURA
WHERE IDTITULACION IS NOT NULL;

-- 28. Mostrar el dni de las personas cuyo apellido contiene la letra g en mayúsculas o minúsculas.
SELECT DNI
FROM PERSONA
WHERE LOWER(APELLIDO) LIKE '%g%';

-- 29. Mostrar las personas varones que tenemos en la base de datos que han nacido con posterioridad a 1970 y que vivan en una ciudad que empieza por M.
SELECT NOMBRE
FROM PERSONA
WHERE VARON = 1
  AND FECHA_NACIMIENTO > DATE '1970-01-01'
  AND UPPER(CIUDAD) LIKE 'M%';

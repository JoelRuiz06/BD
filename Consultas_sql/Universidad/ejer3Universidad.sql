-- 1.Cuantos costes básicos hay
SELECT COUNT(COSTEBASICO) FROM ASIGNATURA;

-- 2.Para cada titulación mostrar el número de asignaturas que hay junto con el nombre de la titulación
SELECT t.nombre, COUNT(a.idasignatura)
FROM titulacion t, asignatura a
WHERE t.idtitulacion = a.idtitulacion
GROUP BY t.nombre;

-- 3.Para cada titulación mostrar el nombre de la titulación junto con el precio total de todas sus asignaturas
SELECT t.nombre, SUM(a.costebasico) FROM ASIGNATURA a, TITULACION t
WHERE t.idtitulacion = a.idtitulacion
GROUP BY t.nombre;

-- 4.Cual sería el coste global de cursar la titulación de Matemáticas si el coste de cada asignatura fuera incrementado en un 7%
SELECT SUM(a.costebasico * 1.07)
FROM asignatura a, titulacion t
WHERE t.idtitulacion = a.idtitulacion
  AND t.nombre LIKE 'Matematicas';

-- 5.Cuantos alumnos hay matriculados en cada asignatura, junto al id de la asignatura
SELECT a.idasignatura, COUNT(aa.idalumno)
FROM alumno_asignatura aa, asignatura a
WHERE aa.idasignatura = a.idasignatura
GROUP BY a.idasignatura;

-- 6.Igual que el anterior pero mostrando el nombre de la asignatura
SELECT a.idasignatura, a.nombre, COUNT(aa.idalumno)
FROM alumno_asignatura aa, asignatura a
WHERE aa.idasignatura = a.idasignatura
GROUP BY a.idasignatura, a.nombre;

/* 7.Mostrar para cada alumno, el nombre del alumno junto con lo que tendría que pagar por el total de todas las asignaturas en las que
está matriculada. Recuerda que el precio de la matrícula tiene un incremento de un 10% por cada año en el que esté matriculado */
SELECT p.nombre, p.apellido,
       SUM(a.costebasico * (1 + aa.numeromatricula * 0.10))
FROM persona p, alumno al, alumno_asignatura aa, asignatura a
WHERE p.dni = al.dni
  AND al.idalumno = aa.idalumno
  AND aa.idasignatura = a.idasignatura
GROUP BY p.nombre, p.apellido;

-- 8.Coste medio de las asignaturas de cada titulación, para aquellas titulaciones en el que el coste total de la 1a matrícula sea mayor que 60 euros
SELECT t.nombre, AVG(IFFNULL(a.costebasico,0)) AS coste_medio
FROM titulacion t, asignatura a
WHERE t.idtitulacion = a.idtitulacion
GROUP BY t.nombre
HAVING SUM(a.costebasico) > 60;

-- 9.Nombre de las titulaciones que tenga mas de tres alumnos
SELECT t.NOMBRE
FROM TITULACION t
JOIN ASIGNATURA a ON a.IDTITULACION = t.IDTITULACION
JOIN ALUMNO_ASIGNATURA aa ON aa.IDASIGNATURA = a.IDASIGNATURA
GROUP BY t.NOMBRE
HAVING COUNT(DISTINCT aa.IDALUMNO) >= 2;

-- 10.Nombre de cada ciudad junto con el número de personas que viven en ella
SELECT ciudad, COUNT(*) AS total_personas
FROM persona
GROUP BY ciudad;

-- 11.Nombre de cada profesor junto con el número de asignaturas que imparte
SELECT p.idprofesor, COUNT(a.idasignatura)
FROM profesor p, asignatura a
WHERE p.idprofesor = a.idprofesor
GROUP BY p.idprofesor;

-- 12.Nombre de cada profesor junto con el número de alumnos que tiene, para aquellos profesores que tengan dos o más de 2 alumnos
SELECT p.idprofesor, COUNT(aa.idalumno)
FROM profesor p, asignatura a, alumno_asignatura aa
WHERE p.idprofesor = a.idprofesor
  AND a.idasignatura = aa.idasignatura
GROUP BY p.idprofesor
HAVING COUNT(aa.idalumno) >= 2;

-- 13.Obtener el máximo de las sumas de los costesbásicos de cada cuatrimestre
SELECT MAX(suma_cuatrimestre)
FROM (
    SELECT cuatrimestre, SUM(costebasico) AS suma_cuatrimestre
    FROM asignatura
    GROUP BY cuatrimestre
);

-- 14.Suma del coste de las asignaturas
SELECT SUM(costebasico) FROM ASIGNATURA a;

-- 15.¿Cuántas asignaturas hay?
SELECT COUNT(idasignatura) FROM ASIGNATURA a;

-- 16.Coste de la asignatura más cara y de la más barata
SELECT MAX(costebasico),MIN(costebasico) FROM ASIGNATURA a;

-- 17.¿Cuántas posibilidades de créditos de asignatura hay?
SELECT COUNT(DISTINCT creditos)
FROM asignatura;

-- 18.¿Cuántos cursos hay?
SELECT COUNT(DISTINCT curso)
FROM asignatura;

-- 19.¿Cuántas ciudades hau? que tengan más de tres alumnos
SELECT COUNT(*)
FROM (
    SELECT ciudad
    FROM persona p, alumno a
    WHERE p.dni = a.dni
    GROUP BY ciudad
    HAVING COUNT(*) > 3
);











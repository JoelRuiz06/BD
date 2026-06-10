-- 12
select a.nombre, a.creditos, t.nombre
from asignatura a, titulacion t
where a.idtitulacion = t.idtitulacion
  and a.cuatrimestre = 1;


-- 13
select a.nombre, a.costebasico, p.nombre
from asignatura a, alumno_asignatura aa, alumno al, persona p
where a.idasignatura = aa.idasignatura
  and aa.idalumno = al.idalumno
  and al.dni = p.dni
  and a.creditos > 4.5;


-- 14
select distinct pe.nombre
from profesor pr, persona pe, asignatura a
where pr.dni = pe.dni
  and a.idprofesor = pr.idprofesor
  and a.costebasico between 25 and 35;


-- 15
select distinct p.nombre
from alumno_asignatura aa, alumno al, persona p
where aa.idalumno = al.idalumno
  and al.dni = p.dni
  and aa.idasignatura in ('150212','130113');


-- 16
select a.nombre, t.nombre
from asignatura a, titulacion t
where a.idtitulacion = t.idtitulacion
  and a.cuatrimestre = 2
  and a.creditos <> 6;


-- 17
select a.nombre,
       a.creditos * 10 as horas,
       al.dni
from asignatura a, alumno_asignatura aa, alumno al
where a.idasignatura = aa.idasignatura(+)
  and aa.idalumno = al.idalumno(+);


-- 18
select distinct p.nombre
from persona p, alumno al, alumno_asignatura aa
where p.dni = al.dni
  and al.idalumno = aa.idalumno
  and p.ciudad = 'Sevilla'
  and p.varon = 0;


-- 19
select a.nombre
from asignatura a
where a.curso = 1
  and a.idprofesor = 'P101';


-- 20
select p.nombre
from persona p, alumno al
where p.dni = al.dni
  and al.idalumno in (
        select idalumno
        from alumno_asignatura
        group by idalumno, idasignatura
        having count(*) >= 3
  );


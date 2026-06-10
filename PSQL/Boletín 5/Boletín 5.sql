/* Crear un procedimiento que en la tabla emp incremente el salario el 10% 
 * a los empleados que tengan una comisión superior al 5% del salario */
CREATE OR REPLACE PROCEDURE SubirSalario IS
BEGIN
    UPDATE EMP
	SET SAL = SAL * 1.10
	WHERE COMM > SAL * 0.05;
END;

SELECT SAL, COMM FROM EMP WHERE COMM > SAL * 0.05;

BEGIN
	SubirSalario;
END;


/* Realiza un procedimiento MostrarMejoresVendedores que muestre 
 * los nombres de los dos vendedores/as con más comisiones. */
CREATE OR REPLACE PROCEDURE MostrarMejoresVendedores IS
BEGIN
	FOR I IN (
        SELECT ENAME
        FROM EMP
        WHERE JOB = 'SALESMAN'
        ORDER BY COMM DESC
        FETCH FIRST 2 ROWS ONLY
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(I.ENAME);
    END LOOP;
END;

SELECT ENAME, COMM
FROM EMP 
WHERE JOB = 'SALESMAN' ORDER BY COMM DESC
FETCH FIRST 2 ROWS ONLY;

BEGIN
	MostrarMejoresVendedores;
END;

/* Realiza un procedimiento MostrarsodaelpmE que reciba el nombre de un departamento al
revés y muestre los nombres de los empleados de ese departamento */
CREATE OR REPLACE PROCEDURE MostrarsodaelpmE(v_dept_reves VARCHAR2) IS
    v_dept_normal VARCHAR2(50);
BEGIN
    v_dept_normal := REVERSE(v_dept_reves);

    FOR I IN (
        SELECT e.ename
        FROM emp e
        JOIN dept d ON e.deptno = d.deptno
        WHERE UPPER(d.dname) = UPPER(v_dept_normal)
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(I.ename);
    END LOOP;
END;

-- CREO MI PROPIA FUNCION DE REVERSE
CREATE OR REPLACE FUNCTION REVERSE(p_txt VARCHAR2)
RETURN VARCHAR2 IS
    v_out VARCHAR2(4000);
BEGIN
    FOR i IN REVERSE 1..LENGTH(p_txt) LOOP
        v_out := v_out || SUBSTR(p_txt, i, 1);
    END LOOP;
    RETURN v_out;
END;


BEGIN
    MostrarsodaelpmE('SELAS'); --SALES
END;

SELECT DNAME FROM DEPT;

SELECT ENAME,DNAME FROM DEPT,EMP WHERE DEPT.DEPTNO = EMP.DEPTNO;








--cursores implicitos (devuelven una unica fila)

SELECT * FROM cliente;

--crea un procedimiento que dado un 
--nombre del cliente me pinte por consola su id.
CREATE OR REPLACE PROCEDURE DAMECODIGO(V_NOMBRE VARCHAR2) IS
V_COD_CLIENTE VARCHAR2(25);
BEGIN
	SELECT COD_CLIENTE INTO V_COD_CLIENTE FROM CLIENTE WHERE NOMBRE =V_NOMBRE;
	DBMS_OUTPUT.PUT_LINE(V_COD_CLIENTE);
END;


BEGIN
	DAMECODIGO('Pepe');
END;



--con un cursor explicito 
CREATE OR REPLACE PROCEDURE DAMECODIGO1(V_NOMBRE VARCHAR2) IS

CURSOR C_COD_CLIENTE(V_NOM varchar2) IS
	SELECT COD_CLIENTE, nombre FROM CLIENTE 
    WHERE NOMBRE =V_NOM;
BEGIN
	FOR fila IN C_COD_CLIENTE(V_NOMBRE) LOOP
		DBMS_OUTPUT.PUT_LINE(fila.cod_cliente);
    END LOOP;
END;


BEGIN
	DAMECODIGO1('Marta');
END;



-- EXCEPCIONES
-- DADO UN NUMERO DE EMPLEADO SI NO EXISTE LO INSERTA Y SI EXISTE MUESTRA EL NOMBRE

CREATE OR REPLACE PROCEDURE PRUEBAEXCEPCION (V_NUMEMP NUMBER) IS
v_excepcion_noexiste EXCEPTION;
V_CUANTOSEMPLEADOS NUMBER;
V_NOMBRE VARCHAR2(25);
BEGIN
	SELECT COUNT(*) INTO V_CUANTOSEMPLEADOS FROM EMP WHERE EMPNO=V_NUMEMP;
    
    IF V_CUANTOSEMPLEADOS=0 THEN
    	RAISE v_excepcion_noexiste;
    ELSE
    		SELECT ENAME INTO V_NOMBRE FROM EMP WHERE EMPNO=V_NUMEMP;
    		DBMS_OUTPUT.PUT_LINE(V_NOMBRE);
    END IF;
EXCEPTION
	WHEN v_excepcion_noexiste THEN
		INSERT INTO EMP (EMPNO,ENAME) VALUES (V_NUMEMP, 'DEFECTO');
END;

--CASOS DE PRUEBAS
-- CASO 1: SI NO EXISTE EL EMPLEADO
BEGIN 
	PRUEBAEXCEPCION(999);
END;

--CASO 2: SI EXSITE EL EMPLEADO

BEGIN 
	PRUEBAEXCEPCION(7369);
END;


--llamar funciones creadas
--SELECT

	SELECT ARITMETICA.SUMA(3,2) FROM DUAL;
--BLOQUE DE CÓDIGO
	DECLARE
	 V_RESULTADO NUMBER;
	BEGIN
		V_RESULTADO:= ARITMETICA.SUMA(3,2) ;
	    DBMS_OUTPUT.PUT_LINE(V_RESULTADO);
	END;


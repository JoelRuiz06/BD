-- 1. Crea un procedimiento llamado ESCRIBE para mostrar por pantalla el mensaje HOLA MUNDO.

CREATE OR REPLACE PROCEDURE ESCRIBE AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('HOLA MUNDO');
END;


BEGIN
  ESCRIBE();
END;

/* 2. Crea un procedimiento llamado ESCRIBE_MENSAJE que tenga un
parámetro de tipo VARCHAR2 que recibe un texto y lo muestre por pantalla.
La forma del procedimiento ser. la siguiente: */

CREATE OR REPLACE PROCEDURE ESCRIBE_MENSAJE (mensaje VARCHAR2) AS
BEGIN
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;

BEGIN
	ESCRIBE_MENSAJE('Hola');
END;


/* 3. Crea un procedimiento llamado SERIE que muestre por pantalla una serie de
números desde un mínimo hasta un máximo con un determinado paso. La
forma del procedimiento ser. la siguiente: */

CREATE OR REPLACE PROCEDURE SERIE (minimo NUMBER, maximo NUMBER, paso NUMBER) AS
    i NUMBER;
BEGIN
    i := minimo;
    WHILE i <= maximo LOOP
        DBMS_OUTPUT.PUT_LINE(i);
        i := i + paso;
    END LOOP;
END;

BEGIN
	SERIE(0,10,2);
END;


/* 4. Crea una función AZAR que reciba dos parámetros y genere un número al
azar entre un mínimo y máximo indicado. La forma de la función será la
siguiente: */


CREATE OR REPLACE FUNCTION AZAR (minimo NUMBER, maximo NUMBER) RETURN NUMBER AS 
	resultado NUMBER;
BEGIN
    resultado := TRUNC(DBMS_RANDOM.VALUE(minimo, maximo + 1));
    RETURN resultado;
END;


SELECT AZAR(0, 10) FROM DUAL;



/* 5. Crea una función NOTA que reciba un parámetro que será una nota numérica
entre 0 y 10 y devuelva una cadena de texto con la calificación (Suficiente,
Bien, Notable, ...). La forma de la función será la siguiente: */

CREATE OR REPLACE FUNCTION NOTA (nota NUMBER) RETURN VARCHAR2 AS
    resultado VARCHAR2(20);
BEGIN
    IF nota < 5 THEN
        resultado := 'Insuficiente';
    ELSIF nota < 6 THEN
        resultado := 'Suficiente';
    ELSIF nota < 7 THEN
        resultado := 'Bien';
    ELSIF nota < 9 THEN
        resultado := 'Notable';
    ELSE
        resultado := 'Sobresaliente';
    END IF;

    RETURN resultado;
END;

SELECT NOTA(10) FROM DUAL;

DECLARE
RESULTADO VARCHAR(100);
BEGIN
	RESULTADO:= NOTA(10);
ALTER 
END;





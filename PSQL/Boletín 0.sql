-- 1. Ejecuta el siguiente bloque. Indica cuál es la salida.
BEGIN
	IF 10 > 5 THEN
	DBMS_OUTPUT.PUT_LINE ('Cierto');
	ELSE
	DBMS_OUTPUT.PUT_LINE ('Falso');
	END IF;
END;


-- Cierto


-- 2. Ejecuta el siguiente bloque. Indica cuál es la salida.
BEGIN
	IF 10 > 5 AND 5 > 1 THEN
	DBMS_OUTPUT.PUT_LINE ('Cierto');
	ELSE
	DBMS_OUTPUT.PUT_LINE ('Falso');
	END IF;
END;


-- Cierto


-- 3. Ejecuta el siguiente bloque. Indica cuál es la salida.
BEGIN
	IF 10 > 5 AND 5 > 50 THEN
	DBMS_OUTPUT.PUT_LINE ('Cierto');
	ELSE
	DBMS_OUTPUT.PUT_LINE ('Falso');
	END IF;
END;


-- Falso


-- 4. Ejecuta el siguiente bloque. Indica cuál es la salida.
BEGIN
	CASE
		WHEN 10 > 5 AND 5 > 50 THEN
		DBMS_OUTPUT.PUT_LINE ('Cierto');
		ELSE
		DBMS_OUTPUT.PUT_LINE ('Falso');
	END CASE;
END;


-- Falso


-- 5. Ejecuta el siguiente bloque. Indica cuál es la salida.
BEGIN
	FOR i IN 1..10 LOOP
	DBMS_OUTPUT.PUT_LINE (i);
	END LOOP;
END;


-- Números del 1 al 10


-- 6. Ejecuta el siguiente bloque. Indica cuál es la salida.
BEGIN
	FOR i IN REVERSE 1..10 LOOP
	DBMS_OUTPUT.PUT_LINE (i);
	END LOOP;
END;


-- Números del 10 al 1


-- 7. Ejecuta el siguiente bloque. Indica cuál es la salida.
DECLARE
num NUMBER(3) := 0;
BEGIN
	WHILE num<=100 LOOP
	DBMS_OUTPUT.PUT_LINE (num);
	num:= num+2;
	END LOOP;
END;


-- Números pares del 0 al 100


-- 8. Ejecuta el siguiente bloque. Indica cuál es la salida.
DECLARE
num NUMBER(3) := 0;
BEGIN
	LOOP
	DBMS_OUTPUT.PUT_LINE (num);
	IF num > 100 THEN EXIT; END IF;
	num:= num+2;
	END LOOP;
END;


-- Va mostrando numeros pares hasta ser mayor que 100 (hasta 102)


-- 9. Ejecuta el siguiente bloque. Indica cuál es la salida.
DECLARE
num NUMBER(3) := 0;
BEGIN
	LOOP
	DBMS_OUTPUT.PUT_LINE (num);
	EXIT WHEN num > 100;
	num:= num+2;
	END LOOP;
END;


-- Lo mismo que el anterior




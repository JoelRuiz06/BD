CREATE TABLE AUDITORIA_EMPLEADOS (DESCRIPCION VARCHAR2(200));

/* Crea un trigger que, cada vez que se inserte o elimine un empleado, registre
una entrada en la tabla AUDITORIA_EMPLEADOS con la fecha del suceso,
número y nombre de empleado, así como el tipo de operación realizada
(INSERCIÓN o ELIMINACIÓN) */
CREATE OR REPLACE TRIGGER t_reg_emp
AFTER INSERT OR DELETE ON EMPLEADOS
FOR EACH ROW
BEGIN
	IF INSERTING THEN
	
		INSERT INTO AUDITORIA_EMPLEADOS VALUES ('En la tabla EMPLEADOS, con fecha ' || TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') || 
										'y usuario: '|| USER || 'Ha realizado la siguiente operacion: INSERT' || ' Num empleado: ' || :NEW.num_empleado || ' Nombre: ' || :NEW.nombre);
	ELSIF DELETING THEN
				INSERT INTO AUDITORIA_EMPLEADOS VALUES ('En la tabla EMPLEADOS, con fecha ' || TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') || 
										'el usuario: '|| USER || ' Ha realizado la siguiente operacion: DELETE' || ' Num empleado: ' || :OLD.num_empleado || ' Nombre: ' || :OLD.nombre);
	END IF;
END;


/* Crea un trigger que, cada vez que se modi(quen datos de un empleado,
registre una entrada en la tabla AUDITORIA_EMPLEADOS con la fecha del
suceso, valor antiguo y valor nuevo de cada campo, así como el tipo de operación
realizada (en este caso MODIFICACIÓN) */
CREATE OR REPLACE TRIGGER t_reg_emp2
AFTER UPDATE ON EMPLEADOS
FOR EACH ROW
BEGIN
    INSERT INTO AUDITORIA_EMPLEADOS VALUES (
        'En la tabla EMPLEADOS, con fecha ' ||
        TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') ||
        ' el usuario: ' || USER ||
        ' ha realizado la siguiente operacion: UPDATE ' ||
        ' Num empleado (OLD): ' || :OLD.NUMEM ||
        ' Num empleado (NEW): ' || :NEW.NUMEM ||
        ' Nombre (OLD): ' || :OLD.NOMEM ||
        ' Nombre (NEW): ' || :NEW.NOMEM
    );
END;


UPDATE EMPLEADOS SET SALAR = 3000, NOMEM = 'CESARITO' WHERE NUMEM = 110;

UPDATE EMPLEADOS SET NOMEM = 'CESARITO' WHERE NUMEM = 110;

SELECT * FROM AUDITORIA_EMPLEADOS;


/* Crea un trigger para que registre en la tabla AUDITORIA_EMPLEADOS las
subidas de salarios superiores al 5% */
CREATE OR REPLACE TRIGGER TRG_EMPLEADOS
AFTER UPDATE OF SALAR ON EMPLEADOS
FOR EACH ROW
WHEN (OLD.SALAR * 1.05 < NEW.SALAR)
BEGIN
	INSERT INTO AUDITORIA_EMPLEADOS VALUES (TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') || 
										' usuario: '|| :OLD.NUMEM || ' con salario anterior: ' 
										|| :OLD.SALAR || ' tiene actualmente un salario de: ' || :NEW.SALAR );
END;

UPDATE EMPLEADOS SET SALAR = 2000 WHERE NUMEM = 110;

 





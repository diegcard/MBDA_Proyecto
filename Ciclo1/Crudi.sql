CREATE OR REPLACE PACKAGE BODY PC_PERSONA AS
    /*Module Personas*/
    PROCEDURE AD_Persona(xnombre IN VARCHAR, xapellidos IN VARCHAR, Xidentificacion IN NUMBER, XtipoIdentificacion IN CHAR, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR) IS
        v_yipoididentificacion NUMBER;
        v_correoElectronico NUMBER;
    BEGIN
        SELECT CASE WHEN COUNT(*) > 0 THEN 1 ELSE 0 END INTO v_yipoididentificacion FROM Personas WHERE identificacion = Xidentificacion;
        SELECT CASE WHEN COUNT(*) > 0 THEN 1 ELSE 0 END INTO v_correoElectronico FROM Personas WHERE correoElectronico = xcorreoElectronico;
        IF v_yipoididentificacion = 1 THEN
            RAISE_APPLICATION_ERROR(-20201, 'Ya existe una persona con esa identificacion');
        ELSIF v_correoElectronico = 1 THEN
            RAISE_APPLICATION_ERROR(-20202, 'Ya existe una persona con ese correo electronico');
        ELSE 
            INSERT INTO Personas(idPersona, nombre, apellidos, identificacion, tipoIdentificacion, dirrecion, correoElectronico)
            VALUES (SEQ_idPersona.NEXTVAL, xnombre, xapellidos, Xidentificacion, XtipoIdentificacion, xdireccion, xcorreoElectronico);
        END IF;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20203, 'No se pudo insertar la persona');
    END AD_Persona;

    PROCEDURE MO_Persona(xidPersona IN NUMBER, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR) IS
    BEGIN
        UPDATE Personas SET 
        dirrecion = xdireccion, 
        correoElectronico = xcorreoElectronico 
        WHERE idPersona = xidPersona;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20204, 'No se pudo modificar la persona');
    END MO_Persona;

    PROCEDURE EL_Persona(xidPersona IN NUMBER) IS
    BEGIN
        DELETE FROM Personas WHERE idPersona = xidPersona;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20205, 'No se pudo eliminar la persona');
    END EL_Persona;
 
    /*Module Telefonos*/
    PROCEDURE AD_Telefono(xidPersona IN NUMBER, xtelefono IN NUMBER) IS
    BEGIN
        INSERT INTO TelefonosPersona(idPersona, telefono)
        VALUES (xidPersona, xtelefono);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20206, 'No se pudo insertar el telefono');
    END AD_Telefono;

    PROCEDURE EL_Telefono(xidPersona IN NUMBER, xtelefono IN NUMBER) IS
        v_telefono NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_telefono FROM TelefonosPersona WHERE idPersona = xidPersona AND telefono = xtelefono;
        IF v_telefono = 0 THEN
            --DBMS_OUTPUT.PUT_LINE('No existe el telefono');
            RAISE_APPLICATION_ERROR(-20207, 'No existe el telefono');
        ELSE
            DELETE FROM TelefonosPersona WHERE idPersona = xidPersona AND telefono = xtelefono;
        END IF;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20208, 'No se pudo eliminar el telefono');
    END EL_Telefono;
    
    /*Module Clientes*/
    PROCEDURE AD_Cliente(xidPersona IN NUMBER, xocupacion IN VARCHAR, xingresos IN NUMBER, xhistorialCredito NUMBER) IS
    BEGIN
        INSERT INTO Clientes(idPersona, ocupacion, ingresos, historialCredito)
        VALUES (xidPersona, xocupacion, xingresos, xhistorialCredito);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20209, 'No se pudo insertar el cliente');
    END AD_Cliente;

    PROCEDURE MO_Cliente(xidPersona IN NUMBER, xocupacion IN VARCHAR, xingresos IN NUMBER, xhistorialCredito NUMBER) IS
    BEGIN
        UPDATE Clientes SET 
        ocupacion = xocupacion, 
        ingresos = xingresos, 
        historialCredito = xhistorialCredito 
        WHERE idPersona = xidPersona;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20210, 'No se pudo modificar el cliente');
    END MO_Cliente;

    /*Module Empleados*/
    PROCEDURE AD_Empleado(xidPersona IN NUMBER, xsexo IN CHAR, xestadoCivil IN CHAR, xcargo IN VARCHAR, xsalario IN NUMBER) IS
    BEGIN
        INSERT INTO Empleados(idPersona, sexo, estadoCivil, cargo, salario)
        VALUES (xidPersona, xsexo, xestadoCivil, xcargo, xsalario);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20211, 'No se pudo insertar el empleado');
    END AD_Empleado;

    PROCEDURE MO_Empleado(xidPersona IN NUMBER, xestadoCivil IN CHAR, xcargo IN VARCHAR, xsalario IN NUMBER) IS
    BEGIN
        UPDATE Empleados SET 
        estadoCivil = xestadoCivil, 
        cargo = xcargo, 
        salario = xsalario 
        WHERE idPersona = xidPersona;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20212, 'No se pudo modificar el empleado');
    END MO_Empleado;

    /*Module Consultas*/
    FUNCTION CO_Persona RETURN SYS_REFCURSOR IS v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT * 
            FROM Personas;
        RETURN v_cursor;
    END CO_Persona;

    FUNCTION CO_TelefonoPersona RETURN SYS_REFCURSOR IS v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT * 
            FROM TelefonosPersona;
        RETURN v_cursor;
    END CO_TelefonoPersona;

    FUNCTION CO_Cliente RETURN SYS_REFCURSOR IS v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT * 
            FROM infoClientes;
        RETURN v_cursor;
    END CO_Cliente;

    FUNCTION CO_Empleado RETURN SYS_REFCURSOR IS v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT * 
            FROM infoEmpleados;
        RETURN v_cursor;
    END CO_Empleado;
END PC_PERSONA;
/

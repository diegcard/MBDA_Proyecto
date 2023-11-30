/*----------Paquete Personas----------*/
/*Module Personas*/
BEGIN
    PC_PERSONA.AD_Persona('John', 'Doe', 123456789, 'C.C', '123 Main St', 'john.doe@xample.com');
END;
/
EXECUTE PC_PERSONA.AD_Persona('Samuel', 'Albarracin', 1000093114, 'C.C', 'Carrera 27 #86-36', 'Samuel.Albarracin@gmail.com');
EXECUTE PC_PERSONA.AD_Persona('Hever', 'Barrera', 1000045114, 'C.C', 'Tocancipa Carrera 7 #4-3', 'Hever.Barrera@gmail.com');

BEGIN
PC_PERSONA.MO_PERSONA(
    XIDPERSONA => 2,
    XDIRECCION => 'No sabe',
    XCORREOELECTRONICO => 'cooco@gmail.com|'
);
END;
/
EXECUTE pc_persona.mo_persona(2, 'Cali', 'ga@gmail.com');

BEGIN
    PC_PERSONA.EL_Persona(1);
END;
/

/*Module Telefonos*/
BEGIN
    PC_PERSONA.AD_Telefono(1, 123456789);
END;
/
EXECUTE PC_PERSONA.AD_Telefono(1, 3145263589);
EXECUTE PC_PERSONA.AD_Telefono(2, 3006816785);
EXECUTE PC_PERSONA.AD_Telefono(3, 3142589647);

BEGIN
    PC_PERSONA.EL_Telefono(1, 123456789);
END;
/
EXECUTE PC_PERSONA.EL_Telefono(1, 123456789);

/*Module Cliente*/

EXECUTE PC_PERSONA.AD_Cliente(1, 'Estudiante', 500000, 0);

BEGIN
    PC_PERSONA.MO_Cliente(
        XIDPERSONA => 1,
        XDESCRIPCION => 'Estudiante',
        XMONTOCREDITO => 500000,
        XESTADO => 1
    );
END;

/*Module Empleado*/

EXECUTE PC_PERSONA.AD_Empleado(2, 'M', 'S', 'Vendedor', 2500000);

EXECUTE PC_PERSONA.MO_Empleado(2, 'C', 'Limpiador', 2500000);
BEGIN
    PC_PERSONA.MO_Empleado(
        XIDPERSONA => 2,
        XESTADOCIVIL => 'S',
        XDESCRIPCION => 'Vendedor',
        XSALARIO => 2500000
    );
END;

/*Module Consultas*/

DECLARE
    CO_Persona SYS_REFCURSOR;
BEGIN
    CO_Persona := PC_PERSONA.CO_Persona;
    DBMS_SQL.RETURN_RESULT(CO_Persona);
END;
/

DECLARE
    CO_TelefonoPersona SYS_REFCURSOR;
BEGIN
    CO_TelefonoPersona := PC_PERSONA.CO_TelefonoPersona;
    DBMS_SQL.RETURN_RESULT(CO_TelefonoPersona);
END;
/

DECLARE
    CO_Cliente SYS_REFCURSOR;
BEGIN
    CO_Cliente := PC_PERSONA.CO_Cliente;
    DBMS_SQL.RETURN_RESULT(CO_Cliente);
END;
/

DECLARE
    CO_Empleado SYS_REFCURSOR;
BEGIN
    CO_Empleado := PC_PERSONA.CO_Empleado;
    DBMS_SQL.RETURN_RESULT(CO_Empleado);
END;
/

/*----------Paquete Ventas----------*/
/*Module Ventas*/
BEGIN
    PC_VENTAS.AD_Venta(1,6, 'Venta de varias Motos', 'A');
END;

EXECUTE PC_VENTAS.AD_Venta(2, 6, 'Venta de varias Motos', 'P');

BEGIN
    PC_VENTAS.MO_Venta(
        XIDVENTA => 2,
        XDESCRIPCION => 'Venta de Otras Motos',
        XESTADO => 'A'
    );
END;

BEGIN
    PC_VENTAS.EL_Venta(2);
END;

/*Module DetalleVenta*/


/*----------Paquete Ventas----------*/
/*Module Productos*/
BEGIN
    PC_PRODUCTOS.AD_Producto('M1', 'Moto RX150', 12000000, 0, 'M', 'N');
END;

EXECUTE PC_PRODUCTOS.AD_Productos('M1', 'Moto RX150', 12000000, 0, 'M', 'N');
EXECUTE PC_PRODUCTOS.AD_Productos('M2', 'Moto Honda XBlade 160', 12500000, 0, 'M', 'N');
EXECUTE PC_PRODUCTOS.AD_Productos('M3', 'Moto Gixxer 250', 15000000, 0, 'M', 'N');
EXECUTE PC_PRODUCTOS.AD_Productos('M4', 'Moto Honda CB 125F 2024', 7100000, 0, 'M', 'N');
EXECUTE PC_PRODUCTOS.AD_Productos('M5', 'Moto Honda CB 190R Repsol 2024', 12400000, 0, 'M', 'N');



EXECUTE PC_PRODUCTOS.AD_Motos('M1', 'Honda','Sport', TO_DATE('2024', 'YYYY'), 'Rojo', 150, 'Ninguna');
EXECUTE PC_PRODUCTOS.AD_Motos('M2', 'Honda','Sport', TO_DATE('2024', 'YYYY'), 'Rojo', 165, NULL);
EXECUTE PC_PRODUCTOS.AD_Motos('M3', 'Suzuki','Sport', TO_DATE('2023', 'YYYY'), 'Negro', 250, NULL);
EXECUTE PC_PRODUCTOS.AD_Motos('M4', 'Honda','Sport', TO_DATE('2024', 'YYYY'), 'Blanca', 125, NULL);
EXECUTE PC_PRODUCTOS.AD_Motos('M5', 'Honda','Sport', TO_DATE('2024', 'YYYY'), 'Negro', 190, NULL);


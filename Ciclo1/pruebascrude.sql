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

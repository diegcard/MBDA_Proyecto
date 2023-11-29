CREATE OR REPLACE PACKAGE PC_PERSONAS AS
    PROCEDURE AD_Persona(xnombre IN VARCHAR, xapellido IN VARCHAR, Xidentificacion IN NUMBER, XtipoIdentificacion IN CHAR, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR);
    PROCEDURE MO_Persona(xidPersona IN NUMBER, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR);
    PROCEDURE EL_Persona(xidPersona IN NUMBER);
END PCC_PERSONAS;

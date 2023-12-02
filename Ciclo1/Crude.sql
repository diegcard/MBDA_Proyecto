/*PACKAGE Personas*/
CREATE OR REPLACE PACKAGE PC_PERSONA AS
    PROCEDURE AD_Persona(xnombre IN VARCHAR, xapellidos IN VARCHAR, Xidentificacion IN NUMBER, XtipoIdentificacion IN CHAR, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR);
    PROCEDURE MO_Persona(xidPersona IN NUMBER, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR);
    PROCEDURE EL_Persona(xidPersona IN NUMBER);
    PROCEDURE AD_Telefono(xidPersona IN NUMBER, xtelefono IN NUMBER);
    PROCEDURE EL_Telefono(xidPersona IN NUMBER, xtelefono IN NUMBER);
    PROCEDURE AD_Cliente(xidPersona IN NUMBER, xocupacion IN VARCHAR, xingresos IN NUMBER, xhistorialCredito NUMBER);
    PROCEDURE MO_Cliente(xidPersona IN NUMBER, xocupacion IN VARCHAR, xingresos IN NUMBER, xhistorialCredito NUMBER);
    PROCEDURE AD_Empleado(xidPersona IN NUMBER, xsexo IN CHAR, xestadoCivil IN CHAR, xcargo IN VARCHAR, xsalario IN NUMBER);
    PROCEDURE MO_Empleado(xidPersona IN NUMBER, xestadoCivil IN CHAR, xcargo IN VARCHAR, xsalario IN NUMBER);
    FUNCTION CO_Persona RETURN SYS_REFCURSOR;
    FUNCTION CO_TelefonoPersona RETURN SYS_REFCURSOR;
    FUNCTION CO_Cliente RETURN SYS_REFCURSOR;
    FUNCTION CO_Empleado RETURN SYS_REFCURSOR;
END PC_PERSONA;
/
/*PACKAGE Ventas*/
CREATE OR REPLACE PACKAGE PC_VENTAS AS
    PROCEDURE AD_Venta(xidEmpleado IN NUMBER, xidCliente IN NUMBER, xdescripcionVenta IN VARCHAR, xestadoVenta IN CHAR);
    PROCEDURE MO_Venta(xidVenta IN NUMBER, xdescripcionVenta IN VARCHAR, xestadoVenta IN CHAR);
    PROCEDURE EL_Venta(xidVenta IN NUMBER);
    PROCEDURE AD_DetalleVenta(xidVenta IN VARCHAR, xidProducto IN VARCHAR, xcantidad IN NUMBER, xprecioUnitario IN NUMBER);
    PROCEDURE EL_DetalleVenta(xidDetalleVenta IN VARCHAR);
    FUNCTION CO_Venta RETURN SYS_REFCURSOR;
    FUNCTION CO_DetalleVenta RETURN SYS_REFCURSOR;
    FUNCTION CO_DetallesVentaEspecifico(xidVenta IN VARCHAR) RETURN SYS_REFCURSOR;
END PC_VENTAS;
/


/*PACKAGE Productos*/
CREATE OR REPLACE PACKAGE PC_PRODUCTOS AS
    --Repuestos
    PROCEDURE AD_Repuestos(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR, xtipoRepuesto IN VARCHAR, xdescripcion IN VARCHAR);
    PROCEDURE MO_Repuestos(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR, xtipoRepuesto IN VARCHAR, xdescripcion IN VARCHAR);
    PROCEDURE EL_Repuestos(xidProducto IN VARCHAR);
    --Motos
    PROCEDURE AD_Motos(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR, xmarca IN VARCHAR, xmodelo IN VARCHAR, xanio IN DATE, xcolor IN VARCHAR, xcilindraje IN VARCHAR, xdescripcion IN VARCHAR);
    PROCEDURE MO_Motos(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR, xmarca IN VARCHAR, xmodelo IN VARCHAR, xanio IN DATE, xcolor IN VARCHAR, xcilindraje IN VARCHAR, xdescripcion IN VARCHAR);
    PROCEDURE EL_Motos(xidProducto IN VARCHAR);
    --Accesorios
    PROCEDURE AD_Accesorios(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR, xdescripcion IN VARCHAR);
    PROCEDURE MO_Accesorios(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR, xdescripcion IN VARCHAR);
    PROCEDURE EL_Accesorios(xidProducto IN VARCHAR);
    --Consultas
    FUNCTION CO_Repuestos RETURN SYS_REFCURSOR;
    FUNCTION CO_Motos RETURN SYS_REFCURSOR;
    FUNCTION CO_Accesorios RETURN SYS_REFCURSOR;
    FUNCTION CO_ProductosBajoStock RETURN SYS_REFCURSOR;
END PC_PRODUCTOS;
/

/*PACKAGE Compras*/
CREATE OR REPLACE PACKAGE PC_COMPRAS AS
    --Proveedor
    PROCEDURE ADD_PROVEEDOR(xnombre IN VARCHAR, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR, xinformacionContacto IN VARCHAR);
    PROCEDURE MO_PROVEEDOR(xidProveedor IN NUMBER, xnombre IN VARCHAR, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR, xinformacionContacto IN VARCHAR);
    PROCEDURE EL_PROVEEDOR(xidProveedor IN NUMBER);
    --Compra
    PROCEDURE AD_xidProveedor()

END PC_COMPRAS;
/

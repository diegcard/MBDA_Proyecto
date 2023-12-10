CREATE OR REPLACE PACKAGE PA_GERENTE AS
    FUNCTION CO_VentasEmpleados RETURN SYS_REFCURSOR;
    FUNCTION CO_VentasClientes RETURN SYS_REFCURSOR;
    FUNCTION CO_VentasProductos RETURN SYS_REFCURSOR;
    FUNCTION Co_VentasMes RETURN SYS_REFCURSOR; 
END PA_GERENTE;
/
--------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE PA_VENDEDOR AS
    --Personas
    FUNCTION CO_TelefonoPersona RETURN SYS_REFCURSOR;
    FUNCTION CO_CLIENTE RETURN SYS_REFCURSOR;
    --Ventas
    PROCEDURE AD_Venta(xidEmpleado IN NUMBER, xidCliente IN NUMBER, xdescripcionVenta IN VARCHAR, xestadoVenta IN CHAR);
    PROCEDURE MO_Venta(xidVenta IN NUMBER, xdescripcionVenta IN VARCHAR, xestadoVenta IN CHAR);
    PROCEDURE AD_DetalleVenta(xidVenta IN VARCHAR, xidProducto IN VARCHAR, xcantidad IN NUMBER, xprecioUnitario IN NUMBER);
    FUNCTION CO_Venta RETURN SYS_REFCURSOR;
    FUNCTION CO_DetalleVenta RETURN SYS_REFCURSOR;
    FUNCTION CO_DetallesVentaEspecifico(xidVenta IN VARCHAR) RETURN SYS_REFCURSOR;
    --Productos
    FUNCTION CO_Repuestos RETURN SYS_REFCURSOR;
    FUNCTION CO_Motos RETURN SYS_REFCURSOR;
    FUNCTION CO_Accesorios RETURN SYS_REFCURSOR;
    FUNCTION CO_ProductosBajoStock RETURN SYS_REFCURSOR;
    --Compras
    PROCEDURE AD_Compra(xidProveedor IN VARCHAR, xidEmpleado IN VARCHAR, xestadoCompra IN CHAR, xdescripcionCompra IN VARCHAR);
    PROCEDURE MO_Compra(xidCompra IN VARCHAR, xestadoCompra IN CHAR, xdescripcionCompra IN VARCHAR);
    PROCEDURE AD_DetalleCompra(xidCompra IN VARCHAR, xidProducto IN VARCHAR, xcantidad IN NUMBER, xprecioUnitario IN NUMBER);
    FUNCTION CO_Proveedor RETURN SYS_REFCURSOR;
    FUNCTION CO_telefono RETURN SYS_REFCURSOR;
    FUNCTION CO_Compras RETURN SYS_REFCURSOR;
    FUNCTION CO_DetalleCompras RETURN SYS_REFCURSOR;
    FUNCTION CO_DetallesCompraEspecifico(xidCompra IN VARCHAR) RETURN SYS_REFCURSOR;
END PA_VENDEDOR;
/
--------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE PA_ADMINISTRADOR AS
    --Personas
    PROCEDURE AD_Cliente(xidPersona IN NUMBER, xtipoIdentificacion IN CHAR, xnombre IN VARCHAR, xapellido IN VARCHAR, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR, xocupacion IN VARCHAR, xingresos IN NUMBER, xhistorialCredito NUMBER);
    PROCEDURE MO_Cliente(xidPersona IN NUMBER, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR, xocupacion IN VARCHAR, xingresos IN NUMBER, xhistorialCredito NUMBER);
    PROCEDURE EL_Cliente(xidPersona IN NUMBER);
    PROCEDURE AD_Empleado(xidPersona IN NUMBER, xtipoIdentificacion IN CHAR, xnombre IN VARCHAR, xapellido IN VARCHAR, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR, xsexo IN CHAR, xestadoCivil IN CHAR, xcargo IN VARCHAR, xsalario IN NUMBER);
    PROCEDURE MO_Empleado(xidPersona IN NUMBER, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR, xestadoCivil IN CHAR, xcargo IN VARCHAR, xsalario IN NUMBER);
    PROCEDURE EL_Empleado(xidPersona IN NUMBER);
    FUNCTION CO_TelefonoPersona RETURN SYS_REFCURSOR;
    FUNCTION CO_Cliente RETURN SYS_REFCURSOR;
    FUNCTION CO_Empleado RETURN SYS_REFCURSOR;
    --Productos
    PROCEDURE AD_Repuestos(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR, xtipoRepuesto IN VARCHAR, xdescripcion IN VARCHAR);
    PROCEDURE MO_Repuestos(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR, xtipoRepuesto IN VARCHAR, xdescripcion IN VARCHAR);
    PROCEDURE EL_Repuestos(xidProducto IN VARCHAR);
    PROCEDURE AD_Motos(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR, xmarca IN VARCHAR, xmodelo IN VARCHAR, xanio IN DATE, xcolor IN VARCHAR, xcilindraje IN VARCHAR, xdescripcion IN VARCHAR);
    PROCEDURE MO_Motos(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR, xmarca IN VARCHAR, xmodelo IN VARCHAR, xanio IN DATE, xcolor IN VARCHAR, xcilindraje IN VARCHAR, xdescripcion IN VARCHAR);
    PROCEDURE EL_Motos(xidProducto IN VARCHAR);
    PROCEDURE AD_Accesorios(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR, xdescripcion IN VARCHAR);
    PROCEDURE MO_Accesorios(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR, xdescripcion IN VARCHAR);
    PROCEDURE EL_Accesorios(xidProducto IN VARCHAR);
    FUNCTION CO_Repuestos RETURN SYS_REFCURSOR;
    FUNCTION CO_Motos RETURN SYS_REFCURSOR;
    FUNCTION CO_Accesorios RETURN SYS_REFCURSOR;
    --Ventas
    PROCEDURE EL_Venta(xidVenta IN NUMBER);
    PROCEDURE EL_DetalleVenta(xidDetalleVenta IN VARCHAR);
    FUNCTION CO_Venta RETURN SYS_REFCURSOR;
    FUNCTION CO_DetalleVenta RETURN SYS_REFCURSOR;
    FUNCTION CO_DetallesVentaEspecifico(xidVenta IN VARCHAR) RETURN SYS_REFCURSOR;
    --Compras
    PROCEDURE AD_Proveedor(xnombre IN VARCHAR, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR, xinformacionContacto IN VARCHAR);
    PROCEDURE MO_Proveedor(xidProveedor IN NUMBER, xnombre IN VARCHAR, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR, xinformacionContacto IN VARCHAR);
    PROCEDURE EL_Proveedor(xidProveedor IN NUMBER);
    PROCEDURE AD_telefono(xidProveedor IN VARCHAR, xtelefono IN NUMBER);
    PROCEDURE EL_telefono(xidProveedor IN VARCHAR, xtelefono IN NUMBER);
    PROCEDURE EL_Compra(xidCompra IN VARCHAR);
    PROCEDURE EL_DetalleCompra(xidDetalleCompra IN VARCHAR);
    FUNCTION CO_Proveedor RETURN SYS_REFCURSOR;
    FUNCTION CO_telefono RETURN SYS_REFCURSOR;
    FUNCTION CO_Compras RETURN SYS_REFCURSOR;
    FUNCTION CO_DetalleCompras RETURN SYS_REFCURSOR;
    FUNCTION CO_DetallesCompraEspecifico(xidCompra IN VARCHAR) RETURN SYS_REFCURSOR;
END PA_ADMINISTRADOR;
/
--------------------------------------------------------------------------------------------------------------------------------------------------------------
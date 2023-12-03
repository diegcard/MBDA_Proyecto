CREATE OR REPLACE PACKAGE PA_GERENTE AS
    FUNCTION CO_VentasEmpleados RETURN SYS_REFCURSOR;
    FUNCTION CO_VentasClientes RETURN SYS_REFCURSOR;
    FUNCTION CO_VentasProductos RETURN SYS_REFCURSOR;
    FUNCTION Co_VentasMes RETURN SYS_REFCURSOR; 
END PA_GERENTE;
/

CREATE OR REPLACE PACKAGE PA_VENDEDOR AS
    FUNCTION CO_TelefonoPersona RETURN SYS_REFCURSOR;
    FUNCTION CO_Cliente RETURN SYS_REFCURSOR;
    PROCEDURE AD_Venta(xidEmpleado IN NUMBER, xidCliente IN NUMBER, xdescripcionVenta IN VARCHAR, xestadoVenta IN CHAR);
    PROCEDURE MO_Venta(xidVenta IN NUMBER, xdescripcionVenta IN VARCHAR, xestadoVenta IN CHAR);
    PROCEDURE AD_DetalleVenta(xidVenta IN VARCHAR, xidProducto IN VARCHAR, xcantidad IN NUMBER, xprecioUnitario IN NUMBER);
    FUNCTION CO_Venta RETURN SYS_REFCURSOR;
    FUNCTION CO_DetalleVenta RETURN SYS_REFCURSOR;
    FUNCTION CO_DetallesVentaEspecifico(xidVenta IN VARCHAR) RETURN SYS_REFCURSOR;
    FUNCTION CO_Repuestos RETURN SYS_REFCURSOR;
    FUNCTION CO_Motos RETURN SYS_REFCURSOR;
    FUNCTION CO_Accesorios RETURN SYS_REFCURSOR;
    FUNCTION CO_ProductosBajoStock RETURN SYS_REFCURSOR;
    PROCEDURE AD_Proveedor(xnombre IN VARCHAR, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR, xinformacionContacto IN VARCHAR);
    PROCEDURE MO_Proveedor(xidProveedor IN NUMBER, xnombre IN VARCHAR, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR, xinformacionContacto IN VARCHAR);
    PROCEDURE EL_Proveedor(xidProveedor IN NUMBER);
    PROCEDURE AD_telefono(xidProveedor IN VARCHAR, xtelefono IN NUMBER);
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

CREATE OR REPLACE PACKAGE PA_ADMINISTRADOR AS
    
END PA_ADMINISTRADOR;
/


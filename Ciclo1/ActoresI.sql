CREATE OR REPLACE PACKAGE BODY PA_GERENTE AS
    FUNCTION CO_VentasEmpleados RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN
        OPEN c_cursor FOR
            SELECT * FROM EmpleadosConMayorVentas;
        RETURN c_cursor;
    END CO_VentasEmpleados;

    FUNCTION CO_VentasClientes RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN
        OPEN c_cursor FOR
            SELECT * FROM ClientesConMayorCompras;
        RETURN c_cursor;
    END CO_VentasClientes;

    FUNCTION CO_VentasProductos RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN
        OPEN c_cursor FOR
            SELECT * FROM ProductoMasVendido;
        RETURN c_cursor;
    END CO_VentasProductos;

    FUNCTION Co_VentasMes RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN
        OPEN c_cursor FOR
            SELECT * FROM VentasPorMes;
        RETURN c_cursor;
    END Co_VentasMes;
END PA_GERENTE;
/
--------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY PA_VENDEDOR AS
    --------------------------------------------------------------------------------------------------------------------------------------------------------------
    --Personas
    FUNCTION CO_TelefonoPersona RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_PERSONA.CO_TelefonoPersona;
        RETURN c_cursor;
    END CO_TelefonoPersona;

    FUNCTION CO_Cliente RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_PERSONA.CO_Cliente;
        RETURN c_cursor;
    END CO_Cliente;
    --------------------------------------------------------------------------------------------------------------------------------------------------------------
    PROCEDURE AD_Venta(xidEmpleado IN NUMBER, xidCliente IN NUMBER, xdescripcionVenta IN VARCHAR, xestadoVenta IN CHAR) IS
    BEGIN
        PC_VENTAS.AD_Venta(xidEmpleado, xidCliente, xdescripcionVenta, xestadoVenta);
    END AD_Venta;

    PROCEDURE MO_Venta(xidVenta IN NUMBER, xdescripcionVenta IN VARCHAR, xestadoVenta IN CHAR) IS
    BEGIN
        PC_VENTAS.MO_Venta(xidVenta, xdescripcionVenta, xestadoVenta);
    END MO_Venta;

    PROCEDURE AD_DetalleVenta(xidVenta IN VARCHAR, xidProducto IN VARCHAR, xcantidad IN NUMBER, xprecioUnitario IN NUMBER) IS
    BEGIN
        PC_VENTAS.AD_DetalleVenta(xidVenta, xidProducto, xcantidad, xprecioUnitario);
    END AD_DetalleVenta;

    FUNCTION CO_Venta RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_VENTAS.CO_Venta;
        RETURN c_cursor;
    END CO_Venta;
    
    FUNCTION CO_DetalleVenta RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_VENTAS.CO_DetalleVenta;
        RETURN c_cursor;
    END CO_DetalleVenta;

    FUNCTION CO_DetallesVentaEspecifico(xidVenta IN VARCHAR) RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_VENTAS.CO_DetallesVentaEspecifico(xidVenta);
        RETURN c_cursor;
    END CO_DetallesVentaEspecifico;
    --------------------------------------------------------------------------------------------------------------------------------------------------------------
    --Productos
    FUNCTION CO_Repuestos RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_PRODUCTOS.CO_Repuestos;
        RETURN c_cursor;
    END CO_Repuestos;

    FUNCTION CO_Motos RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_PRODUCTOS.CO_Motos;
        RETURN c_cursor;
    END CO_Motos;

    FUNCTION CO_Accesorios RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_PRODUCTOS.CO_Accesorios;
        RETURN c_cursor;
    END CO_Accesorios;

    FUNCTION CO_ProductosBajoStock RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_PRODUCTOS.CO_ProductosBajoStock;
        RETURN c_cursor;
    END CO_ProductosBajoStock;
    --------------------------------------------------------------------------------------------------------------------------------------------------------------
    --Compras
    PROCEDURE AD_Compra(xidProveedor IN VARCHAR, xidEmpleado IN VARCHAR, xestadoCompra IN CHAR, xdescripcionCompra IN VARCHAR) IS
    BEGIN
        PC_COMPRAS.AD_Compra(xidProveedor, xidEmpleado, xestadoCompra, xdescripcionCompra);
    END AD_Compra;

    PROCEDURE MO_Compra(xidCompra IN VARCHAR, xestadoCompra IN CHAR, xdescripcionCompra IN VARCHAR) IS
    BEGIN
        PC_COMPRAS.MO_Compra(xidCompra, xestadoCompra, xdescripcionCompra);
    END MO_Compra;

    PROCEDURE AD_DetalleCompra(xidCompra IN VARCHAR, xidProducto IN VARCHAR, xcantidad IN NUMBER, xprecioUnitario IN NUMBER) IS
    BEGIN
        PC_COMPRAS.AD_DetalleCompra(xidCompra, xidProducto, xcantidad, xprecioUnitario);
    END AD_DetalleCompra;

    FUNCTION CO_Proveedor RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_COMPRAS.CO_Proveedor;
        RETURN c_cursor;
    END CO_Proveedor;

    FUNCTION CO_telefono RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_COMPRAS.CO_telefono;
        RETURN c_cursor;
    END CO_telefono;

    FUNCTION CO_Compras RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_COMPRAS.CO_Compras;
        RETURN c_cursor;
    END CO_Compras;

    FUNCTION CO_DetalleCompras RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_COMPRAS.CO_DetalleCompras;
        RETURN c_cursor;
    END CO_DetalleCompras;

    FUNCTION CO_DetallesCompraEspecifico(xidCompra IN VARCHAR) RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_COMPRAS.CO_DetallesCompraEspecifico(xidCompra);
        RETURN c_cursor;
    END CO_DetallesCompraEspecifico;
END PA_VENDEDOR;
/
--------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY PA_ADMINISTRADOR AS
    --------------------------------------------------------------------------------------------------------------------------------------------------------------
    PROCEDURE AD_Persona(xnombre IN VARCHAR, xapellidos IN VARCHAR, Xidentificacion IN NUMBER, XtipoIdentificacion IN CHAR, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR) IS
    BEGIN
        PC_PERSONA.AD_Persona(xnombre, xapellidos, Xidentificacion, XtipoIdentificacion, xdireccion, xcorreoElectronico);
    END AD_Persona;

    PROCEDURE MO_Persona(xidPersona IN NUMBER, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR) IS
    BEGIN
        PC_PERSONA.MO_Persona(xidPersona, xdireccion, xcorreoElectronico);
    END MO_Persona;

    PROCEDURE EL_Persona(xidPersona IN NUMBER) IS
    BEGIN
        PC_PERSONA.EL_Persona(xidPersona);
    END EL_Persona;

    PROCEDURE AD_Telefono(xidPersona IN NUMBER, xtelefono IN NUMBER) IS
    BEGIN
        PC_PERSONA.AD_Telefono(xidPersona, xtelefono);
    END AD_Telefono;

    PROCEDURE EL_Telefono(xidPersona IN NUMBER, xtelefono IN NUMBER) IS
    BEGIN
        PC_PERSONA.EL_Telefono(xidPersona, xtelefono);
    END EL_Telefono;

    PROCEDURE AD_Cliente(xidPersona IN NUMBER, xocupacion IN VARCHAR, xingresos IN NUMBER, xhistorialCredito NUMBER) IS
    BEGIN
        PC_PERSONA.AD_Cliente(xidPersona, xocupacion, xingresos, xhistorialCredito);
    END AD_Cliente;

    PROCEDURE MO_Cliente(xidPersona IN NUMBER, xocupacion IN VARCHAR, xingresos IN NUMBER, xhistorialCredito NUMBER) IS
    BEGIN
        PC_PERSONA.MO_Cliente(xidPersona, xocupacion, xingresos, xhistorialCredito);
    END MO_Cliente;

    PROCEDURE AD_Empleado(xidPersona IN NUMBER, xsexo IN CHAR, xestadoCivil IN CHAR, xcargo IN VARCHAR, xsalario IN NUMBER) IS
    BEGIN
        PC_PERSONA.AD_Empleado(xidPersona, xsexo, xestadoCivil, xcargo, xsalario);
    END AD_Empleado;

    PROCEDURE MO_Empleado(xidPersona IN NUMBER, xestadoCivil IN CHAR, xcargo IN VARCHAR, xsalario IN NUMBER) IS
    BEGIN
        PC_PERSONA.MO_Empleado(xidPersona, xestadoCivil, xcargo, xsalario);
    END MO_Empleado;

    FUNCTION CO_Persona RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_PERSONA.CO_Persona;
        RETURN c_cursor;
    END CO_Persona;

    FUNCTION CO_TelefonoPersona RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_PERSONA.CO_TelefonoPersona;
        RETURN c_cursor;
    END CO_TelefonoPersona;

    FUNCTION CO_Cliente RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_PERSONA.CO_Cliente;
        RETURN c_cursor;
    END CO_Cliente;

    FUNCTION CO_Empleado RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_PERSONA.CO_Empleado;
        RETURN c_cursor;
    END CO_Empleado;
    --------------------------------------------------------------------------------------------------------------------------------------------------------------
    --Productos
    PROCEDURE AD_Repuestos(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR, xtipoRepuesto IN VARCHAR, xdescripcion IN VARCHAR) IS
    BEGIN
        PC_PRODUCTOS.AD_Repuestos(xidProducto, xnombre, xprecio, xcantidadEnStock, xtipoProducto, xestadoProducto, xtipoRepuesto, xdescripcion);
    END AD_Repuestos;

    PROCEDURE MO_Repuestos(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR, xtipoRepuesto IN VARCHAR, xdescripcion IN VARCHAR) IS
    BEGIN
        PC_PRODUCTOS.MO_Repuestos(xidProducto, xnombre, xprecio, xcantidadEnStock, xtipoProducto, xestadoProducto, xtipoRepuesto, xdescripcion);
    END MO_Repuestos;

    PROCEDURE EL_Repuestos(xidProducto IN VARCHAR) IS
    BEGIN
        PC_PRODUCTOS.EL_Repuestos(xidProducto);
    END EL_Repuestos;

    PROCEDURE AD_Motos(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR, xmarca IN VARCHAR, xmodelo IN VARCHAR, xanio IN DATE, xcolor IN VARCHAR, xcilindraje IN VARCHAR, xdescripcion IN VARCHAR) IS
    BEGIN
        PC_PRODUCTOS.AD_Motos(xidProducto, xnombre, xprecio, xcantidadEnStock, xtipoProducto, xestadoProducto, xmarca, xmodelo, xanio, xcolor, xcilindraje, xdescripcion);
    END AD_Motos;

    PROCEDURE MO_Motos(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR, xmarca IN VARCHAR, xmodelo IN VARCHAR, xanio IN DATE, xcolor IN VARCHAR, xcilindraje IN VARCHAR, xdescripcion IN VARCHAR) IS
    BEGIN
        PC_PRODUCTOS.MO_Motos(xidProducto, xnombre, xprecio, xcantidadEnStock, xtipoProducto, xestadoProducto, xmarca, xmodelo, xanio, xcolor, xcilindraje, xdescripcion);
    END MO_Motos;

    PROCEDURE EL_Motos(xidProducto IN VARCHAR) IS
    BEGIN
        PC_PRODUCTOS.EL_Motos(xidProducto);
    END EL_Motos;

    PROCEDURE AD_Accesorios(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR, xdescripcion IN VARCHAR) IS
    BEGIN
        PC_PRODUCTOS.AD_Accesorios(xidProducto, xnombre, xprecio, xcantidadEnStock, xtipoProducto, xestadoProducto, xdescripcion);
    END AD_Accesorios;

    PROCEDURE MO_Accesorios(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR, xdescripcion IN VARCHAR) IS
    BEGIN
        PC_PRODUCTOS.MO_Accesorios(xidProducto, xnombre, xprecio, xcantidadEnStock, xtipoProducto, xestadoProducto, xdescripcion);
    END MO_Accesorios;

    PROCEDURE EL_Accesorios(xidProducto IN VARCHAR) IS
    BEGIN
        PC_PRODUCTOS.EL_Accesorios(xidProducto);
    END EL_Accesorios;

    FUNCTION CO_Repuestos RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_PRODUCTOS.CO_Repuestos;
        RETURN c_cursor;
    END CO_Repuestos;

    FUNCTION CO_Motos RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_PRODUCTOS.CO_Motos;
        RETURN c_cursor;
    END CO_Motos;
    
    FUNCTION CO_Accesorios RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_PRODUCTOS.CO_Accesorios;
        RETURN c_cursor;
    END CO_Accesorios;
    --------------------------------------------------------------------------------------------------------------------------------------------------------------
    --Ventas
    PROCEDURE EL_Venta(xidVenta IN NUMBER) IS
    BEGIN
        PC_VENTAS.EL_Venta(xidVenta);
    END EL_Venta;

    PROCEDURE EL_DetalleVenta(xidDetalleVenta IN VARCHAR) IS
    BEGIN
        PC_VENTAS.EL_DetalleVenta(xidDetalleVenta);
    END EL_DetalleVenta;

    FUNCTION CO_Venta RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_VENTAS.CO_Venta;
        RETURN c_cursor;
    END CO_Venta;

    FUNCTION CO_DetalleVenta RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_VENTAS.CO_DetalleVenta;
        RETURN c_cursor;
    END CO_DetalleVenta;

    FUNCTION CO_DetallesVentaEspecifico(xidVenta IN VARCHAR) RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_VENTAS.CO_DetallesVentaEspecifico(xidVenta);
        RETURN c_cursor;
    END CO_DetallesVentaEspecifico;
    --------------------------------------------------------------------------------------------------------------------------------------------------------------
    --Compras
    PROCEDURE AD_Proveedor(xnombre IN VARCHAR, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR, xinformacionContacto IN VARCHAR) IS
    BEGIN
        PC_COMPRAS.AD_Proveedor(xnombre, xdireccion, xcorreoElectronico, xinformacionContacto);
    END AD_Proveedor;

    PROCEDURE MO_Proveedor(xidProveedor IN NUMBER, xnombre IN VARCHAR, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR, xinformacionContacto IN VARCHAR) IS
    BEGIN
        PC_COMPRAS.MO_Proveedor(xidProveedor, xnombre, xdireccion, xcorreoElectronico, xinformacionContacto);
    END MO_Proveedor;

    PROCEDURE EL_Proveedor(xidProveedor IN NUMBER) IS
    BEGIN
        PC_COMPRAS.EL_Proveedor(xidProveedor);
    END EL_Proveedor;

    PROCEDURE AD_telefono(xidProveedor IN VARCHAR, xtelefono IN NUMBER) IS
    BEGIN
        PC_COMPRAS.AD_telefono(xidProveedor, xtelefono);
    END AD_telefono;

    PROCEDURE EL_telefono(xidProveedor IN VARCHAR, xtelefono IN NUMBER) IS
    BEGIN
        PC_COMPRAS.EL_telefono(xidProveedor, xtelefono);
    END EL_telefono;

    PROCEDURE EL_Compra(xidCompra IN VARCHAR) IS
    BEGIN
        PC_COMPRAS.EL_Compra(xidCompra);
    END EL_Compra;

    PROCEDURE EL_DetalleCompra(xidDetalleCompra IN VARCHAR) IS
    BEGIN
        PC_COMPRAS.EL_DetalleCompra(xidDetalleCompra);
    END EL_DetalleCompra;

    FUNCTION CO_Proveedor RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_COMPRAS.CO_Proveedor;
        RETURN c_cursor;
    END CO_Proveedor;

    FUNCTION CO_telefono RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_COMPRAS.CO_telefono;
        RETURN c_cursor;
    END CO_telefono;

    FUNCTION CO_Compras RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_COMPRAS.CO_Compras;
        RETURN c_cursor;
    END CO_Compras;

    FUNCTION CO_DetalleCompras RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_COMPRAS.CO_DetalleCompras;
        RETURN c_cursor;
    END CO_DetalleCompras;

    FUNCTION CO_DetallesCompraEspecifico(xidCompra IN VARCHAR) RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN 
        c_cursor := PC_COMPRAS.CO_DetallesCompraEspecifico(xidCompra);
        RETURN c_cursor;
    END CO_DetallesCompraEspecifico;
END PA_ADMINISTRADOR;
/
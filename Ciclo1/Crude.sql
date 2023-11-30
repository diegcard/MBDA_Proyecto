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
    --FUNCTION CO_Venta RETURN SYS_REFCURSOR;
    --FUNCTION CO_DetalleVenta RETURN SYS_REFCURSOR;
    --FUNCTION CO_DetallesVentaEspecifico(xidVenta IN VARCHAR) RETURN SYS_REFCURSOR;
END PC_VENTAS;
/

CREATE OR REPLACE PACKAGE BODY PC_VENTAS AS
    /*Module Venta*/
    PROCEDURE AD_Venta(xidEmpleado IN NUMBER, xidCliente IN NUMBER, xdescripcionVenta IN VARCHAR, xestadoVenta IN CHAR) IS
    BEGIN
        INSERT INTO Ventas(idVenta, idEmpleado, idCliente, descripcionVenta, estadoVenta) 
        VALUES(SEQ_idVenta.NEXTVAL, xidEmpleado, xidCliente, xdescripcionVenta, xestadoVenta);
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20213, 'No se pudo agregar la venta');
    END AD_Venta;

    PROCEDURE MO_Venta(xidVenta IN NUMBER, xdescripcionVenta IN VARCHAR, xestadoVenta IN CHAR) IS
    BEGIN
        UPDATE Ventas SET 
        descripcionVenta = xdescripcionVenta, 
        estadoVenta = xestadoVenta 
        WHERE idVenta = xidVenta;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20214, 'No se pudo modificar la venta');
    END MO_Venta;

    PROCEDURE EL_Venta(xidVenta IN NUMBER) IS
    BEGIN
        DELETE FROM Ventas WHERE idVenta = xidVenta;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20215, 'No se pudo eliminar la venta');
    END EL_Venta;

    /*Module DetalleVenta*/
    PROCEDURE AD_DetalleVenta(xidVenta IN VARCHAR, xidProducto IN VARCHAR, xcantidad IN NUMBER, xprecioUnitario IN NUMBER) IS
    BEGIN
        INSERT INTO DetallesVentas(idDetalleVenta, idVenta, idProducto, cantidad, precioUnitario) 
        VALUES(SEQ_idDetalleVenta.NEXTVAL, xidVenta, xidProducto, xcantidad, xprecioUnitario);
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20216, 'No se pudo agregar el detalle de la venta');
    END AD_DetalleVenta;

    PROCEDURE EL_DetalleVenta(xidDetalleVenta IN VARCHAR) IS
    BEGIN
        DELETE FROM DetallesVentas 
        WHERE idDetalleVenta = xidDetalleVenta;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20217, 'No se pudo eliminar el detalle de la venta');
    END EL_DetalleVenta;

    /*Module Consultas*/
END PC_VENTAS;
/

/*PACKAGE Productos*/
CREATE OR REPLACE PACKAGE PC_PRODUCTOS AS
    PROCEDURE AD_Productos(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR);
    PROCEDURE MO_Productos(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR);
    PROCEDURE EL_Productos(xidProducto IN VARCHAR);
    PROCEDURE AD_Repuestos(xidProducto IN VARCHAR, xtipo IN VARCHAR, xdescripcion IN VARCHAR);
    PROCEDURE MO_Repuestos(xidProducto IN VARCHAR, xtipo IN VARCHAR, xdescripcion IN VARCHAR);
    PROCEDURE AD_MOTOS(xidProductos IN VARCHAR, xmarca IN VARCHAR, xmodelo IN VARCHAR, xanio IN DATE, xcolor IN VARCHAR, xcilindraje IN VARCHAR, xdescripcion IN VARCHAR);
    PROCEDURE MO_MOTOS(xidProductos IN VARCHAR, xmarca IN VARCHAR, xmodelo IN VARCHAR, xanio IN DATE, xcolor IN VARCHAR, xcilindraje IN VARCHAR, xdescripcion IN VARCHAR);
    PROCEDURE AD_Accesorios(xidProducto IN VARCHAR, xdescripcion IN VARCHAR);
    PROCEDURE MO_Accesorios(xidProducto IN VARCHAR, xdescripcion IN VARCHAR);
END PC_PRODUCTOS;
/

CREATE OR REPLACE PACKAGE BODY PC_PRODUCTOS AS
    /*Module Productos*/
    PROCEDURE AD_Productos(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR) IS
    BEGIN
        INSERT INTO Productos(idProducto, nombre, precio, cantidadEnStock, tipoProducto, estadoProducto) 
        VALUES(xidProducto, xnombre, xprecio, xcantidadEnStock, xtipoProducto, xestadoProducto);
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20218, 'No se pudo agregar el producto');
    END AD_Productos;

    PROCEDURE MO_Productos(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR) IS
    BEGIN
        UPDATE Productos SET 
        nombre = xnombre, 
        precio = xprecio, 
        cantidadEnStock = xcantidadEnStock, 
        tipoProducto = xtipoProducto, 
        estadoProducto = xestadoProducto 
        WHERE idProducto = xidProducto;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20219, 'No se pudo modificar el producto');
    END MO_Productos;

    PROCEDURE EL_Productos(xidProducto IN VARCHAR) IS
    BEGIN
        DELETE FROM Productos WHERE idProducto = xidProducto;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20220, 'No se pudo eliminar el producto');
    END EL_Productos;

    /*Module Repuestos*/
    PROCEDURE AD_Repuestos(xidProducto IN VARCHAR, xtipo IN VARCHAR, xdescripcion IN VARCHAR) IS
    BEGIN
        INSERT INTO Repuestos(idProducto, tipo, descripcion) 
        VALUES(xidProducto, xtipo, xdescripcion);
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20221, 'No se pudo agregar el repuesto');
    END AD_Repuestos;

    PROCEDURE MO_Repuestos(xidProducto IN VARCHAR, xtipo IN VARCHAR, xdescripcion IN VARCHAR) IS
    BEGIN
        UPDATE Repuestos SET 
        tipo = xtipo,
        descripcion = xdescripcion 
        WHERE idProducto = xidProducto;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20222, 'No se pudo modificar el repuesto');
    END MO_Repuestos;

    /*Module Motos*/
    PROCEDURE AD_Motos(xidProductos IN VARCHAR, xmarca IN VARCHAR, xmodelo IN VARCHAR, xanio IN DATE, xcolor IN VARCHAR, xcilindraje IN VARCHAR, xdescripcion IN VARCHAR) IS
    BEGIN
        INSERT INTO Motos(idProducto, marca, modelo, anio, color, cilindraje, descripcion) 
        VALUES(xidProductos, xmarca, xmodelo, xanio, xcolor, xcilindraje, xdescripcion);
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20223, 'No se pudo agregar la moto');
    END AD_Motos;

    PROCEDURE MO_Motos(xidProductos IN VARCHAR, xmarca IN VARCHAR, xmodelo IN VARCHAR, xanio IN DATE, xcolor IN VARCHAR, xcilindraje IN VARCHAR, xdescripcion IN VARCHAR) IS
    BEGIN
        UPDATE Motos SET 
        marca = xmarca, 
        modelo = xmodelo, 
        anio = xanio, 
        color = xcolor, 
        cilindraje = xcilindraje, 
        descripcion = xdescripcion 
        WHERE idProducto = xidProductos;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20224, 'No se pudo modificar la moto');
    END MO_Motos;

    /*Module Accesorios*/
    PROCEDURE AD_Accesorios(xidProducto IN VARCHAR, xdescripcion IN VARCHAR) IS
    BEGIN
        INSERT INTO Accesorios(idProducto, descripcion) 
        VALUES(xidProducto, xdescripcion);
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20225, 'No se pudo agregar el accesorio');
    END AD_Accesorios;
    
    PROCEDURE MO_Accesorios(xidProducto IN VARCHAR, xdescripcion IN VARCHAR) IS
    BEGIN
        UPDATE Accesorios SET 
        descripcion = xdescripcion 
        WHERE idProducto = xidProducto;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20226, 'No se pudo modificar el accesorio');
    END MO_Accesorios;
END PC_PRODUCTOS;
/

/*PACKAGE Compras*/
CREATE OR REPLACE PACKAGE PC_COMPRAS AS
    PROCEDURE AD_Compra(xidEmpleado IN NUMBER, xidProveedor IN NUMBER, xdescripcionCompra IN VARCHAR, xestadoCompra IN CHAR);
END PC_COMPRAS;
/
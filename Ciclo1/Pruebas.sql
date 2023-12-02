



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

    FUNCTION CO_Venta RETURN SYS_REFCURSOR IS
        xcursor SYS_REFCURSOR;
    BEGIN
        OPEN xcursor FOR
        SELECT * FROM Ventas;
        RETURN xcursor;
    END CO_Venta;

    FUNCTION CO_DetalleVenta RETURN SYS_REFCURSOR IS
        xcursor SYS_REFCURSOR;
    BEGIN
        OPEN xcursor FOR
        SELECT * FROM DetallesVentas;
        RETURN xcursor;
    END CO_DetalleVenta;

    FUNCTION CO_DetallesVentaEspecifico(xidVenta IN VARCHAR) RETURN SYS_REFCURSOR IS
        xcursor SYS_REFCURSOR;
    BEGIN
        OPEN xcursor FOR
        SELECT * FROM DetallesVentas WHERE idVenta = xidVenta;
        RETURN xcursor;
    END CO_DetallesVentaEspecifico;

END PC_VENTAS;
/

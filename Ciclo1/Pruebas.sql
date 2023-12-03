CREATE OR REPLACE PACKAGE PC_COMPRAS AS
    --Proveedor
    PROCEDURE AD_Proveedor(xnombre IN VARCHAR, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR, xinformacionContacto IN VARCHAR);
    PROCEDURE MO_Proveedor(xidProveedor IN NUMBER, xnombre IN VARCHAR, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR, xinformacionContacto IN VARCHAR);
    PROCEDURE EL_Proveedor(xidProveedor IN NUMBER);
    --TelefonoProveedor
    PROCEDURE AD_telefono(xidProveedor IN VARCHAR, xtelefono IN NUMBER);
    PROCEDURE EL_telefono(xidProveedor IN VARCHAR, xtelefono IN NUMBER);
    --Compra
    PROCEDURE AD_Compra(idProveedor IN VARCHAR, idEmpleado IN VARCHAR, estadoCompra IN CHAR, descripcionCompra IN VARCHAR);
    PROCEDURE MO_Compra(idCompra IN VARCHAR, estadoCompra IN CHAR, descripcionCompra IN VARCHAR);
    PROCEDURE EL_Compra(idCompra IN VARCHAR);
    --Detalle Compra
    PROCEDURE AD_DetalleCompra(idCompra IN VARCHAR, idProducto IN VARCHAR, cantidad IN NUMBER, precioUnitario IN NUMBER);
    PROCEDURE EL_DetalleCompra(idDetalleCompra IN VARCHAR);
    --Consultas
    FUNCTION CO_Proveedor RETURN SYS_REFCURSOR;
    FUNCTION CO_telefono RETURN SYS_REFCURSOR;
    FUNCTION CO_Compras RETURN SYS_REFCURSOR;
    FUNCTION CO_DetalleCompras RETURN SYS_REFCURSOR;
    FUNCTION CO_DetallesCompraEspecifico(xidCompra IN VARCHAR) RETURN SYS_REFCURSOR;
END PC_COMPRAS;
/
CREATE OR REPLACE PACKAGE BODY PC_COMPRAS AS
    PROCEDURE AD_Proveedor(xnombre IN VARCHAR, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR, xinformacionContacto IN VARCHAR) IS
    BEGIN
        INSERT INTO Proveedores(idProveedor, nombre, direccion, correoElectronico, informacionContacto) 
        VALUES(SEQ_idProveedor.NEXTVAL, xnombre, xdireccion, xcorreoElectronico, xinformacionContacto);
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20228, 'No se pudo agregar el proveedor');
    END AD_Proveedor;

    PROCEDURE MO_Proveedor(xidProveedor IN NUMBER, xnombre IN VARCHAR, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR, xinformacionContacto IN VARCHAR) IS
    BEGIN
        UPDATE Proveedores SET 
        nombre = xnombre, 
        direccion = xdireccion, 
        correoElectronico = xcorreoElectronico, 
        informacionContacto = xinformacionContacto 
        WHERE idProveedor = xidProveedor;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20229, 'No se pudo modificar el proveedor');
    END MO_Proveedor;

    PROCEDURE EL_Proveedor(xidProveedor IN NUMBER) IS
    BEGIN
        DELETE FROM Proveedores WHERE idProveedor = xidProveedor;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20230, 'No se pudo eliminar el proveedor');
    END EL_Proveedor;

    PROCEDURE AD_telefono(xidProveedor IN VARCHAR, xtelefono IN NUMBER) IS
    BEGIN
        INSERT INTO TelefonosProveedores(idProveedor, telefono) 
        VALUES(xidProveedor, xtelefono);
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20231, 'No se pudo agregar el telefono');
    END AD_telefono;

    PROCEDURE EL_telefono(xidProveedor IN VARCHAR, xtelefono IN NUMBER) IS
    BEGIN
        DELETE FROM TelefonosProveedores 
        WHERE idProveedor = xidProveedor AND telefono = xtelefono;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20232, 'No se pudo eliminar el telefono');
    END EL_telefono;

    PROCEDURE AD_Compra(idProveedor IN VARCHAR, idEmpleado IN VARCHAR, estadoCompra IN CHAR, descripcionCompra IN VARCHAR) IS
    BEGIN
        INSERT INTO Compras(idCompra, idProveedor, idEmpleado, estadoCompra, descripcionCompra) 
        VALUES(SEQ_idCompra.NEXTVAL, idProveedor, idEmpleado, estadoCompra, descripcionCompra);
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20233, 'No se pudo agregar la compra');
    END AD_Compra;

    PROCEDURE MO_Compra(idCompra IN VARCHAR, estadoCompra IN CHAR, descripcionCompra IN VARCHAR) IS
    BEGIN
        UPDATE Compras SET 
        estadoCompra = estadoCompra, 
        descripcionCompra = descripcionCompra 
        WHERE idCompra = idCompra;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20234, 'No se pudo modificar la compra');
    END MO_Compra;

    PROCEDURE EL_Compra(idCompra IN VARCHAR) IS
    BEGIN
        DELETE FROM Compras 
        WHERE idCompra = idCompra;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20235, 'No se pudo eliminar la compra');
    END EL_Compra;

    PROCEDURE AD_DetalleCompra(idCompra IN VARCHAR, idProducto IN VARCHAR, cantidad IN NUMBER, precioUnitario IN NUMBER) IS
    BEGIN
        INSERT INTO DetallesCompras(idDetalleCompra, idCompra, idProducto, cantidad, precioUnitario) 
        VALUES(SEQ_idDetalleCompra.NEXTVAL, idCompra, idProducto, cantidad, precioUnitario);
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20236, 'No se pudo agregar el detalle de la compra');
    END AD_DetalleCompra;

    PROCEDURE EL_DetalleCompra(idDetalleCompra IN VARCHAR) IS
    BEGIN
        DELETE FROM DetallesCompras 
        WHERE idDetalleCompra = idDetalleCompra;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20237, 'No se pudo eliminar el detalle de la compra');
    END EL_DetalleCompra;

    FUNCTION CO_Proveedor RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN
        OPEN c_cursor FOR 
            SELECT * 
            FROM Proveedores;
        RETURN c_cursor;
    END CO_Proveedor;

    FUNCTION CO_telefono RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN
        OPEN c_cursor FOR 
            SELECT * 
            FROM TelefonosProveedores;
        RETURN c_cursor;
    END CO_telefono;

    FUNCTION CO_Compras RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN
        OPEN c_cursor FOR 
            SELECT * 
            FROM Compras;
        RETURN c_cursor;
    END CO_Compras;

    FUNCTION CO_DetalleCompras RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN
        OPEN c_cursor FOR 
            SELECT * 
            FROM DetallesCompras;
        RETURN c_cursor;
    END CO_DetalleCompras;

    FUNCTION CO_DetallesCompraEspecifico(xidCompra IN VARCHAR) RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN
        OPEN c_cursor FOR 
            SELECT * 
            FROM DetallesCompras 
            WHERE idCompra = xidCompra;
        RETURN c_cursor;
    END CO_DetallesCompraEspecifico;

END PC_COMPRAS;
/
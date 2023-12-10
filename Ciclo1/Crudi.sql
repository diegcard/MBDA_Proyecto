CREATE OR REPLACE PACKAGE BODY PC_PERSONA AS
    ----------------------------------------------------------------------------------------------------------------------------
    /*Module Clientes*/
    PROCEDURE AD_Cliente(xidPersona IN NUMBER, xtipoIdentificacion IN CHAR, xnombre IN VARCHAR, xapellido IN VARCHAR, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR, xocupacion IN VARCHAR, xingresos IN NUMBER, xhistorialCredito NUMBER) IS
    BEGIN
        INSERT INTO Personas(idPersona, tipoIdentificacion, nombre, apellido, direccion, correoElectronico)
        VALUES (xidPersona, xtipoIdentificacion, xnombre, xapellido, xdireccion, xcorreoElectronico);

        INSERT INTO Clientes(idPersona, ocupacion, ingresos, historialCredito)
        VALUES (xidPersona, xocupacion, xingresos, xhistorialCredito);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20201, 'No se pudo insertar el cliente');
    END AD_Cliente;

    PROCEDURE MO_Cliente(xidPersona IN NUMBER, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR, xocupacion IN VARCHAR, xingresos IN NUMBER, xhistorialCredito NUMBER) IS
    BEGIN
        UPDATE Personas SET
        direccion = xdireccion,
        correoElectronico = xcorreoElectronico
        WHERE idPersona = xidPersona;

        UPDATE Clientes SET 
        ocupacion = xocupacion, 
        ingresos = xingresos, 
        historialCredito = xhistorialCredito 
        WHERE idPersona = xidPersona;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20202, 'No se pudo modificar el cliente');
    END MO_Cliente;

    PROCEDURE EL_Cliente(xidPersona IN NUMBER) IS
    BEGIN
        DELETE FROM Clientes WHERE idPersona = xidPersona;
        DELETE FROM Personas WHERE idPersona = xidPersona;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20203, 'No se pudo eliminar el cliente');
    END EL_Cliente;

    ----------------------------------------------------------------------------------------------------------------------------
    /*Module Empleados*/
    PROCEDURE AD_Empleado(xidPersona IN NUMBER, xtipoIdentificacion IN CHAR, xnombre IN VARCHAR, xapellido IN VARCHAR, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR, xsexo IN CHAR, xestadoCivil IN CHAR, xcargo IN VARCHAR, xsalario IN NUMBER) IS
    BEGIN
        INSERT INTO Personas(idPersona, tipoIdentificacion, nombre, apellido, direccion, correoElectronico)
        VALUES (xidPersona, xtipoIdentificacion, xnombre, xapellido, xdireccion, xcorreoElectronico);

        INSERT INTO Empleados(idPersona, sexo, estadoCivil, cargo, salario)
        VALUES (xidPersona, xsexo, xestadoCivil, xcargo, xsalario);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20204, 'No se pudo insertar el empleado');
    END AD_Empleado;

    PROCEDURE MO_Empleado(xidPersona IN NUMBER, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR, xestadoCivil IN CHAR, xcargo IN VARCHAR, xsalario IN NUMBER) IS
    BEGIN
        UPDATE Personas SET
        direccion = xdireccion,
        correoElectronico = xcorreoElectronico
        WHERE idPersona = xidPersona;

        UPDATE Empleados SET 
        estadoCivil = xestadoCivil, 
        cargo = xcargo, 
        salario = xsalario 
        WHERE idPersona = xidPersona;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20205, 'No se pudo modificar el empleado');
    END MO_Empleado;

    PROCEDURE EL_Empleado(xidPersona IN NUMBER) IS
    BEGIN
        DELETE FROM Empleados WHERE idPersona = xidPersona;
        DELETE FROM Personas WHERE idPersona = xidPersona;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20206, 'No se pudo eliminar el empleado');
    END EL_Empleado;
    
        ----------------------------------------------------------------------------------------------------------------------------
    /*Module Telefonos*/
    PROCEDURE AD_Telefono(xidPersona IN NUMBER, xtelefono IN NUMBER) IS
    BEGIN
        INSERT INTO TelefonosPersona(idPersona, telefono)
        VALUES (xidPersona, xtelefono);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20207, 'No se pudo insertar el telefono');
    END AD_Telefono;

    PROCEDURE EL_Telefono(xidPersona IN NUMBER, xtelefono IN NUMBER) IS
        v_telefono NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_telefono FROM TelefonosPersona WHERE idPersona = xidPersona AND telefono = xtelefono;
        IF v_telefono = 0 THEN
            --DBMS_OUTPUT.PUT_LINE('No existe el telefono');
            RAISE_APPLICATION_ERROR(-20208, 'No existe el telefono');
        ELSE
            DELETE FROM TelefonosPersona WHERE idPersona = xidPersona AND telefono = xtelefono;
        END IF;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20209, 'No se pudo eliminar el telefono');
    END EL_Telefono;

    ----------------------------------------------------------------------------------------------------------------------------
    /*Module Consultas*/

    FUNCTION CO_TelefonoPersona RETURN SYS_REFCURSOR IS v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT * 
            FROM TelefonosPersona;
        RETURN v_cursor;
    END CO_TelefonoPersona;

    FUNCTION CO_Cliente RETURN SYS_REFCURSOR IS v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT * 
            FROM infoClientes;
        RETURN v_cursor;
    END CO_Cliente;

    FUNCTION CO_Empleado RETURN SYS_REFCURSOR IS v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT * 
            FROM infoEmpleados;
        RETURN v_cursor;
    END CO_Empleado;
END PC_PERSONA;
/
----------------------------------------------------------------------------------------------------------------------------
/*Module ventas*/
CREATE OR REPLACE PACKAGE BODY PC_VENTAS AS
    ----------------------------------------------------------------------------------------------------------------------------
    PROCEDURE AD_Venta(xidEmpleado IN NUMBER, xidCliente IN NUMBER, xdescripcionVenta IN VARCHAR, xestadoVenta IN CHAR) IS
    BEGIN
        INSERT INTO Ventas(idEmpleado, idCliente, descripcionVenta, estadoVenta) 
        VALUES(xidEmpleado, xidCliente, xdescripcionVenta, xestadoVenta);
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
    ----------------------------------------------------------------------------------------------------------------------------
    PROCEDURE AD_DetalleVenta(xidVenta IN VARCHAR, xidProducto IN VARCHAR, xcantidad IN NUMBER, xprecioUnitario IN NUMBER) IS
    BEGIN
        INSERT INTO DetallesVentas(idVenta, idProducto, cantidad, precioUnitario) 
        VALUES(xidVenta, xidProducto, xcantidad, xprecioUnitario);
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
    ----------------------------------------------------------------------------------------------------------------------------
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
----------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY PC_PRODUCTOS AS
    ----------------------------------------------------------------------------------------------------------------------------
    PROCEDURE AD_Repuestos(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR, xtipoRepuesto IN VARCHAR, xdescripcion IN VARCHAR) IS
    BEGIN
        INSERT INTO Productos(idProducto, nombre, precio, cantidadEnStock, tipoProducto, estadoProducto) 
        VALUES(xidProducto, xnombre, xprecio, xcantidadEnStock, xtipoProducto, xestadoProducto);

        INSERT INTO Repuestos(idProducto, tipo, descripcion) 
        VALUES(xidProducto, xtipoRepuesto, xdescripcion);
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20219, 'No se pudo agregar el repuesto');
    END AD_Repuestos;

    PROCEDURE MO_Repuestos(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR, xtipoRepuesto IN VARCHAR, xdescripcion IN VARCHAR) IS
    BEGIN
        UPDATE Productos SET 
        nombre = xnombre, 
        precio = xprecio, 
        cantidadEnStock = xcantidadEnStock, 
        tipoProducto = xtipoProducto, 
        estadoProducto = xestadoProducto 
        WHERE idProducto = xidProducto;

        UPDATE Repuestos SET 
        tipo = xtipoRepuesto, 
        descripcion = xdescripcion 
        WHERE xidProducto = xidProducto;

        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20220, 'No se pudo modificar el repuesto');
    END MO_Repuestos;

    PROCEDURE EL_Repuestos(xidProducto IN VARCHAR) IS
    BEGIN
        DELETE FROM Productos WHERE idProducto = xidProducto;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20221, 'No se pudo eliminar el repuesto');
    END EL_Repuestos;

    ----------------------------------------------------------------------------------------------------------------------------
    PROCEDURE AD_Motos(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR, 
    xmarca IN VARCHAR, xmodelo IN VARCHAR, xanio IN DATE, xcolor IN VARCHAR, xcilindraje IN VARCHAR, xdescripcion IN VARCHAR) IS
    BEGIN 
        INSERT INTO Productos(idProducto, nombre, precio, cantidadEnStock, tipoProducto, estadoProducto) 
        VALUES(xidProducto, xnombre, xprecio, xcantidadEnStock, xtipoProducto, xestadoProducto);

        INSERT INTO Motos(idProducto, marca, modelo, anio, color, cilindraje, descripcion) 
        VALUES(xidProducto, xmarca, xmodelo, xanio, xcolor, xcilindraje, xdescripcion);
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20222, 'No se pudo agregar la moto');
    END AD_Motos;

    PROCEDURE MO_Motos(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR,
    xmarca IN VARCHAR, xmodelo IN VARCHAR, xanio IN DATE, xcolor IN VARCHAR, xcilindraje IN VARCHAR, xdescripcion IN VARCHAR) IS
    BEGIN
        UPDATE Productos SET 
        nombre = xnombre, 
        precio = xprecio, 
        cantidadEnStock = xcantidadEnStock, 
        tipoProducto = xtipoProducto, 
        estadoProducto = xestadoProducto 
        WHERE idProducto = xidProducto;

        UPDATE Motos SET 
        marca = xmarca, 
        modelo = xmodelo, 
        anio = xanio, 
        color = xcolor, 
        cilindraje = xcilindraje, 
        descripcion = xdescripcion 
        WHERE idProducto = xidProducto;

        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20223, 'No se pudo modificar la moto');
    END MO_Motos;

    PROCEDURE EL_Motos(xidProducto IN VARCHAR) IS
    BEGIN
        DELETE FROM Motos WHERE idProducto = xidProducto;
        DELETE FROM Productos WHERE idProducto = xidProducto;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20224, 'No se pudo eliminar la moto');
    END EL_Motos;
    ----------------------------------------------------------------------------------------------------------------------------

    PROCEDURE AD_Accesorios(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR, xdescripcion IN VARCHAR) IS
    BEGIN
        INSERT INTO Productos(idProducto, nombre, precio, cantidadEnStock, tipoProducto, estadoProducto) 
        VALUES(xidProducto, xnombre, xprecio, xcantidadEnStock, xtipoProducto, xestadoProducto);

        INSERT INTO Accesorios(idProducto, descripcion) 
        VALUES(xidProducto, xdescripcion);
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20225, 'No se pudo agregar el accesorio');
    END AD_Accesorios;

    PROCEDURE MO_Accesorios(xidProducto IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xcantidadEnStock IN NUMBER, xtipoProducto IN CHAR, xestadoProducto IN CHAR, xdescripcion IN VARCHAR) IS
    BEGIN
        UPDATE Productos SET 
        nombre = xnombre, 
        precio = xprecio, 
        cantidadEnStock = xcantidadEnStock, 
        tipoProducto = xtipoProducto, 
        estadoProducto = xestadoProducto 
        WHERE idProducto = xidProducto;

        UPDATE Accesorios SET 
        descripcion = xdescripcion 
        WHERE idProducto = xidProducto;

        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20226, 'No se pudo modificar el accesorio');
    END MO_Accesorios;

    PROCEDURE EL_Accesorios(xidProducto IN VARCHAR) IS
    BEGIN
        DELETE FROM Productos 
        WHERE idProducto = xidProducto;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20227, 'No se pudo eliminar el accesorio');
    END EL_Accesorios;
    ----------------------------------------------------------------------------------------------------------------------------
    FUNCTION CO_Repuestos RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN
        OPEN c_cursor FOR 
            SELECT * 
            FROM infoRepuestos;
        RETURN c_cursor;
    END CO_Repuestos;

    FUNCTION CO_Motos RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN
        OPEN c_cursor FOR 
            SELECT * 
            FROM infoMotos;
        RETURN c_cursor;
    END CO_Motos;

    FUNCTION CO_Accesorios RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN
        OPEN c_cursor FOR 
            SELECT * 
            FROM infoAccesorios;
        RETURN c_cursor;
    END CO_Accesorios;

    FUNCTION CO_ProductosBajoStock RETURN SYS_REFCURSOR IS c_cursor SYS_REFCURSOR;
    BEGIN
        OPEN c_cursor FOR 
            SELECT * 
            FROM ProductoDebajoStock;
        RETURN c_cursor;
    END CO_ProductosBajoStock;

END PC_PRODUCTOS;
/
----------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY PC_COMPRAS AS
    PROCEDURE AD_Proveedor(xnombre IN VARCHAR, xdireccion IN VARCHAR, xcorreoElectronico IN VARCHAR, xinformacionContacto IN VARCHAR) IS
    BEGIN
        INSERT INTO Proveedores(nombre, direccion, correoElectronico, informacionContacto) 
        VALUES(xnombre, xdireccion, xcorreoElectronico, xinformacionContacto);
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

    ----------------------------------------------------------------------------------------------------------------------------


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

    ----------------------------------------------------------------------------------------------------------------------------

    PROCEDURE AD_Compra(xidProveedor IN VARCHAR, xidEmpleado IN VARCHAR, xestadoCompra IN CHAR, xdescripcionCompra IN VARCHAR) IS
    BEGIN
        INSERT INTO Compras(idProveedor, idEmpleado, estadoCompra, descripcionCompra) 
        VALUES(xidProveedor, xidEmpleado, xestadoCompra, xdescripcionCompra);
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20233, 'No se pudo agregar la compra');
    END AD_Compra;

    PROCEDURE MO_Compra(xidCompra IN VARCHAR, xestadoCompra IN CHAR, xdescripcionCompra IN VARCHAR) IS
    BEGIN
        UPDATE Compras SET 
        estadoCompra = xestadoCompra, 
        descripcionCompra = xdescripcionCompra 
        WHERE idCompra = xidCompra;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20234, 'No se pudo modificar la compra');
    END MO_Compra;

    PROCEDURE EL_Compra(xidCompra IN VARCHAR) IS
    BEGIN
        DELETE FROM Compras 
        WHERE idCompra = xidCompra;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20235, 'No se pudo eliminar la compra');
    END EL_Compra;

    ----------------------------------------------------------------------------------------------------------------------------

    PROCEDURE AD_DetalleCompra(xidCompra IN VARCHAR, xidProducto IN VARCHAR, xcantidad IN NUMBER, xprecioUnitario IN NUMBER) IS
    BEGIN
        INSERT INTO DetallesCompras(idCompra, idProducto, cantidad, precioUnitario) 
        VALUES(xidCompra, xidProducto, xcantidad, xprecioUnitario);
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20236, 'No se pudo agregar el detalle de la compra');
    END AD_DetalleCompra;

    PROCEDURE EL_DetalleCompra(xidDetalleCompra IN VARCHAR) IS
    BEGIN
        DELETE FROM DetallesCompras 
        WHERE idDetalleCompra = xidDetalleCompra;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20237, 'No se pudo eliminar el detalle de la compra');
    END EL_DetalleCompra;

    ----------------------------------------------------------------------------------------------------------------------------

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
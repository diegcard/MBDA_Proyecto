SELECT * FROM Personas;

SELECT * FROM Clientes;

EXECUTE PC_PERSONA.AD_Persona('Hever', 'Barrera', 1000045114, 'C.C', 'Tocancipa Carrera 7 #4-3', 'Hever.Barrera@gmail.com');


EXECUTE PC_PERSONA.AD_Cliente(3, 'Estudiante', 500000, 0);



/*--------------------ModuleVentasOK------------------------------------*/

BEGIN 
    PC_VENTAS.AD_Venta(
        xidEmpleado=>2,
        xidCliente=>3,
        xdescripcionVenta=>'Venta de repuestos',
        xestadoVenta=>'A'
    );
END;
/

EXECUTE PC_VENTAS.el_venta(
    xidVenta=>2
    );

BEGIN 
    PC_VENTAS.AD_DetalleVenta(
        xidVenta=>SEQ_idVenta.CURRVAL,
        xidProducto=>'R8',
        xcantidad=>1,
        xprecioUnitario=>12000
    );
END;

EXECUTE PC_VENTAS.EL_DetalleVenta(
    xidDetalleVenta=>2,
    );











/*--------------------ModuleProductosOK------------------------------------*/
BEGIN
    PC_PRODUCTOS.AD_Repuestos(
        xidProducto=>'R1',
        xnombre=>'Llanta',
        xprecio=> 100000,
        xcantidadEnStock=> 0,
        xtipoProducto=>'R',
        xestadoProducto=>'A',
        xtipoRepuesto=>'Llanta',
        xdescripcion=>'Llanta para moto Honda XR 150L');   
END;
/
/*Crude Productos*/
--Ejecutable PC.AD_Repuestos
BEGIN
    PC_PRODUCTOS.AD_Repuestos(
        xidProducto=>'R1',
        xnombre=>'Llanta',
        xprecio=> 100000,
        xcantidadEnStock=> 0,
        xtipoProducto=>'R',
        xestadoProducto=>'A',
        xtipoRepuesto=>'Llanta',
        xdescripcion=>'Llanta para moto Honda XR 150L');   
END;
/
--Ejecutable PC.MO_Repuestos
BEGIN 
    PC_PRODUCTOS.MO_Repuestos(
        xidProducto=>'R1',
        xnombre=>'Llanta B',
        xprecio=> 500000,
        xcantidadEnStock=> 0,
        xtipoProducto=>'R',
        xestadoProducto=>'D',
        xtipoRepuesto=>'Llanta',
        xdescripcion=>'Llanta para moto XR 150L');   
END;
/
--Ejecutable PC.EL_Repuestos
BEGIN
    PC_PRODUCTOS.EL_Repuestos(xidProducto=>'R1');
END;
--Ejecutable PC.ADDMotos
BEGIN
    PC_PRODUCTOS.AD_Motos(
        xidProducto=>'M2',
        xnombre=>'Honda XR 150L',
        xprecio=> 5000000,
        xcantidadEnStock=> 0,
        xtipoProducto=>'M',
        xestadoProducto=>'D',
        xmarca=>'Honda',
        xmodelo=>'XR 150L',
        xanio=>TO_DATE('2019-01-01', 'YYYY-MM-DD'),
        xcolor=>'Rojo',
        xcilindraje=>'150',
        xdescripcion=>'Moto Honda XR 150L');
END;
/
--Ejecutable PC.MO_Motos
BEGIN 
    PC_PRODUCTOS.MO_Motos(
        xidProducto=>'M2',
        xnombre=>'Honda XR 150L',
        xprecio=> 5000000,
        xcantidadEnStock=> 5,
        xtipoProducto=>'M',
        xestadoProducto=>'D',
        xmarca=>'Honda',
        xmodelo=>'XR 150L',
        xanio=>TO_DATE('2019-01-01', 'YYYY-MM-DD'),
        xcolor=>'Rojo',
        xcilindraje=>'150',
        xdescripcion=>'Moto Honda XR 150L');
END;
/
--Ejecutable PC.EL_Motos
BEGIN
    PC_PRODUCTOS.EL_Motos(
        xidProducto=>'M2');
END;
/
--Ejecutable PC.AD_Accesorios
BEGIN
    PC_PRODUCTOS.AD_Accesorios(
        xidProducto=>'A1',
        xnombre=>'Casco',
        xprecio=> 100000,
        xcantidadEnStock=> 0,
        xtipoProducto=>'A',
        xestadoProducto=>'D',
        xdescripcion=>'Casco para moto');
END;
/
--Ejecutable PC.MO_Accesorios
BEGIN
    PC_PRODUCTOS.MO_Accesorios(
        xidProducto=>'A1',
        xnombre=>'Casco',
        xprecio=> 100000,
        xcantidadEnStock=> 5,
        xtipoProducto=>'A',
        xestadoProducto=>'D',
        xdescripcion=>'Casco para moto');
END;
/
--Ejecutable PC.EL_Accesorios
BEGIN
    PC_PRODUCTOS.EL_Accesorios(
        xidProducto=>'A1');
END;
/
--Ejecutable Consultas
DECLARE
    CO_Repuestos SYS_REFCURSOR;
BEGIN
    CO_Repuestos := PC_PRODUCTOS.CO_Repuestos;
    DBMS_SQL.RETURN_RESULT(CO_Repuestos);
END;
/

DECLARE
    CO_Motos SYS_REFCURSOR;
BEGIN
    CO_Motos := PC_PRODUCTOS.CO_Motos;
    DBMS_SQL.RETURN_RESULT(CO_Motos);
END;
/

DECLARE
    CO_Accesorios SYS_REFCURSOR;
BEGIN
    CO_Accesorios := PC_PRODUCTOS.CO_Accesorios;
    DBMS_SQL.RETURN_RESULT(CO_Accesorios);
END;
/

DECLARE
    CO_ProductosBajoStock SYS_REFCURSOR;
BEGIN
    CO_ProductosBajoStock := PC_PRODUCTOS.CO_ProductosBajoStock;
    DBMS_SQL.RETURN_RESULT(CO_ProductosBajoStock);
END;
/

/*Crude Compras*/

-- Ejecutable PC.AD_Proveedor
BEGIN
    PC_COMPRAS.AD_Proveedor('Proveedor1', 'Dirección1', 'correo1@example.com', 'Contacto1');
END;
/

-- Ejecutable PC.MO_Proveedor
BEGIN
    PC_COMPRAS.MO_Proveedor(1, 'Proveedor1', 'Nueva Dirección', 'nuevo_correo@example.com', 'Nuevo Contacto');
END;
/

-- Ejecutable PC.EL_Proveedor
BEGIN
    PC_COMPRAS.EL_Proveedor(1);
END;

-- Ejecutable PC.AD_Compra
BEGIN
    PC_COMPRAS.AD_Compra(
        xidProveedor=>'1',
        xidEmpleado=>'2',
        xestadoCompra=>'A',
        xdescripcionCompra=>'Compra de repuestos'
        );
END;
/
-- Ejecutable PC.MO_Compra
BEGIN
    PC_COMPRAS.MO_Compra(
        xidCompra=>1,
        xestadoCompra=>'A',
        xdescripcionCompra=>'Compra de repuestos'
        );
END;
/
-- Ejecutable PC.EL_Compra
BEGIN
    PC_COMPRAS.EL_Compra(1);
END;
/
-- Ejecutable PC.AD_DetalleCompra
BEGIN
    PC_COMPRAS.AD_DetalleCompra(
        xidCompra=>'1',
        xidProducto=>'R8',
        xcantidad=>5,
        xprecioUnitario=>100000
        );
END;
/
-- Ejecutable PC.El_DetalleCompra
BEGIN
    PC_COMPRAS.EL_DetalleCompra(1);
END;
/
/*ActoresOK PACKAGE Gerente*/
--CO_VentasEmpleados
DECLARE
    v_cursor SYS_REFCURSOR;
BEGIN
    v_cursor := PA_GERENTE.CO_VentasEmpleados;
    DBMS_SQL.RETURN_RESULT(v_cursor);
END;
/
--CO_VentasClientes
DECLARE 
    v_cursor SYS_REFCURSOR;
BEGIN 
    v_cursor := PA_GERENTE.CO_VentasClientes;
    DBMS_SQL.RETURN_RESULT(v_cursor);
END;
/
--CO_VentasProductos
DECLARE 
    v_cursor SYS_REFCURSOR;
BEGIN
    v_cursor := PA_GERENTE.CO_VentasProductos;
    DBMS_SQL.RETURN_RESULT(v_cursor);
END;
/
--CO_VentasMes
DECLARE 
    v_cursor SYS_REFCURSOR;
BEGIN
    v_cursor := PA_GERENTE.CO_VentasMes;
    DBMS_SQL.RETURN_RESULT(v_cursor);
END;
/

/*ActoresOK PACKAGE Vendedor*/
--CO_TelefonoPersona
DECLARE
    v_cursor SYS_REFCURSOR;
BEGIN
    v_cursor := PA_VENDEDOR.CO_TelefonoPersona;
    DBMS_SQL.RETURN_RESULT(v_cursor);
END;
/
--CO_Cliente
DECLARE
    v_cursor SYS_REFCURSOR;
BEGIN
    v_cursor := PA_VENDEDOR.CO_Cliente;
    DBMS_SQL.RETURN_RESULT(v_cursor);
END;
/
--AD_Venta
BEGIN
    PA_VENDEDOR.AD_Venta(xidcliente=>1,
                         xidempleado=>2,
                         xestadocompra=>'A',
                         xdescripcioncompra=>'Recibido Correctamente');
END;
/
--AD_DetalleVenta
BEGIN
    PA_VENDEDOR.AD_DetalleVenta(xidventa=>1,
                                xidproducto=>1,
                                xcantidad=>1,
                                xprecio=>1,
                                xdescuento=>1);
END;
/
--CO_Venta
DECLARE
    v_cursor SYS_REFCURSOR;
BEGIN
    v_cursor := PA_VENDEDOR.CO_Venta;
    DBMS_SQL.RETURN_RESULT(v_cursor);
END;
/
--CO_DetalleVenta
DECLARE
    v_cursor SYS_REFCURSOR;
BEGIN
    v_cursor := PA_VENDEDOR.CO_DetalleVenta;
    DBMS_SQL.RETURN_RESULT(v_cursor);
END;
--CO_DetallesVentaEspecifico
DECLARE
    v_cursor SYS_REFCURSOR;
BEGIN
    v_cursor := PA_VENDEDOR.CO_DetallesVentaEspecifico(xidventa=>1);
    DBMS_SQL.RETURN_RESULT(v_cursor);
END;
/
--CO_infoRepuestos
DECLARE
    v_cursor SYS_REFCURSOR;
BEGIN
    v_cursor := PA_VENDEDOR.CO_infoRepuestos;
    DBMS_SQL.RETURN_RESULT(v_cursor);
END;
/
--CO_infoMotos
DECLARE
    v_cursor SYS_REFCURSOR;
BEGIN
    v_cursor := PA_VENDEDOR.CO_infoMotos;
    DBMS_SQL.RETURN_RESULT(v_cursor);
END;
/
--CO_infoAccesorios
DECLARE
    v_cursor SYS_REFCURSOR;
BEGIN
    v_cursor := PA_VENDEDOR.CO_infoAccesorios;
    DBMS_SQL.RETURN_RESULT(v_cursor);
END;
/
--AD_Proveedor
DECLARE
    v_cursor SYS_REFCURSOR;
BEGIN
    v_cursor := PA_VENDEDOR.AD_Proveedor(xnombre=>'Proveedor1',
                                         xtelefono=>'12345678',
                                         xdireccion=>'Direccion1',
                                         xcorreo=>'Correo1');
    DBMS_SQL.RETURN_RESULT(v_cursor);
END;
/
--MO_Proveedor
DECLARE
    v_cursor SYS_REFCURSOR;
BEGIN
    v_cursor := PA_VENDEDOR.MO_Proveedor(xidproveedor=>1,
                                         xnombre=>'Proveedor1',
                                         xtelefono=>'12345678',
                                         xdireccion=>'Direccion1',
                                         xcorreo=>'Correo1');
    DBMS_SQL.RETURN_RESULT(v_cursor);
END;
/
--CO_Proveedor
DECLARE
    v_cursor SYS_REFCURSOR;
BEGIN
    v_cursor := PA_VENDEDOR.CO_Proveedor;
    DBMS_SQL.RETURN_RESULT(v_cursor);
END;
/
--AD_Compra
BEGIN 
    PA_VENDEDOR.AD_Compra(xidproveedor=>1,
                          xidempleado=>2,
                          xestadocompra=>'A',
                          xdescripcioncompra=>'Recibido Correctamente');
END;
/
--AD_DetalleCompra
BEGIN 
    PA_VENDEDOR.AD_DetalleVenta(xidventa=>1,
                                xidproducto=>1,
                                xcantidad=>1,
                                xprecio=>1,
                                xdescuento=>1);
END;
/
--CO_Compra
DECLARE
    cursor_ SYS_REFCURSOR;
BEGIN
    cursor_ := pa_vendedor.CO_Compras;
    DBMS_SQL.RETURN_RESULT(cursor_);
END;
/
--CO_DetalleCompras
DECLARE
    cursor_ SYS_REFCURSOR;
BEGIN
    cursor_ := pa_vendedor.CO_DetalleCompras;
    DBMS_SQL.RETURN_RESULT(cursor_);
END;
/
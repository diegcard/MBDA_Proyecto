











/*Testing PACKAGE Vendedor*/



EXECUTE pa_vendedor.ad_compra(xidproveedor=>1,xidempleado=>2,xestadocompra=>'A',xdescripcioncompra=>'Recivido Correctamente');

DECLARE
    cursor_ SYS_REFCURSOR;
BEGIN
    cursor_ := pa_vendedor.CO_Compras;
    DBMS_SQL.RETURN_RESULT(cursor_);
END;
/
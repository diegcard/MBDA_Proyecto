CREATE OR REPLACE BODY PA_GERENTE AS
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




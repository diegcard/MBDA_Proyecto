--Historias

--1

--Diego Cardenas
/*
Diedgo es un Empleado de la empresa el tiene el rol de Vendedor
El el dia de hoy tuvo un dia un poco pesado y registro unas 5 5 de las cuales todas fueron exitosas
El quiere almacenar todo en la base de datos, primero el inicia session en la base de datos
Le pide al administrador que cree el usurio para el
porteriormente el ingresa los datos de la Venta y el sistema lo almacena en la base de datos
*/

--Creacion del usuario 

EXECUTE PA_ADMINISTRADOR.AD_Empleado (1000093114, 'C.C', 'Diego', 'Cardenas', 'Auto Norte 104', 'Diego@gmail.com', 'H', 'D', 'Vendedor', 3500000);

-- Es un cliente Nuevo por ende Crea El Perfil del Cliente

EXECUTE PC_PERSONA.AD_Cliente (52083589, 'C.C' ,'Julian', 'Cardenas', 'Calle 5 # 86-69', 'juliancard@gmail.com', 'Ingenieri',3200000, 780);

--Registra la venta
BEGIN
    --Venta
    PC_VENTAS.AD_Venta(1000093114, 5587740841, 'Venta de repuestos bajo cilindraje', 'A');
    --DetallesVentas
    PC_VENTAS.AD_DetalleVenta(SEQ_idVenta.CURRVAL, 'R1', 4, 250000);
    PC_VENTAS.AD_DetalleVenta(SEQ_idVenta.CURRVAL, 'R7', 2, 458000);
    PC_VENTAS.AD_DetalleVenta(SEQ_idVenta.CURRVAL, 'R10', 3, 2600000);
    PC_VENTAS.AD_DetalleVenta(SEQ_idVenta.CURRVAL, 'R4', 4, 980000);
END;
/
/*Posteriormente llega el proveedor de Suzuki al que le habiamos solicitado unas motos las cuales llegaron el dia de hoy y diego registro la venta*/

BEGIN
    --Compra
    PC_COMPRAS.AD_Compra(7, 1000093114, 'A', 'Compra de Motos A suzuki');
    --DetallesComptas
    PC_COMPRAS.AD_DetalleCompra(SEQ_idCompra.CURRVAL, 'M1', 8, 7500000);
    PC_COMPRAS.AD_DetalleCompra(SEQ_idCompra.CURRVAL, 'M2', 5, 25000000);
    PC_COMPRAS.AD_DetalleCompra(SEQ_idCompra.CURRVAL, 'M3', 4, 78000000);
    PC_COMPRAS.AD_DetalleCompra(SEQ_idCompra.CURRVAL, 'M4', 4, 32000000);
    PC_COMPRAS.AD_DetalleCompra(SEQ_idCompra.CURRVAL, 'M5', 1, 14000000);
END;
/

/*Enseguida Diego Verifica la informacion mas actual*/

DECLARE
    CO_Cursor SYS_REFCURSOR;
BEGIN
    CO_Cursor := PA_VENDEDOR.CO_Compra;
    DBMS_SQL.RETURN_RESULT(CO_Cursor);
END;
/

/*El gerente le solicita a Diego que le diga Cuales Motos estan por debajo del STOCK*/

DECLARE
    CO_Cursor SYS_REFCURSOR;
BEGIN
    CO_Cursor := PA_VENDEDOR.CO_ProductosBajoStock;
    DBMS_SQL.RETURN_RESULT(CO_Cursor);
END;
/



--2

-- Jeymmi Yaya
/*Jeymmi es la adminitradora de la base de datos, ella tiene que estar pendiente de todas las demas acciones que no 
Hace el vendedor Ella es la unica qure puede resgitrar personal y puede eliminar en la base de datos,
EL dia de hoy Diego el vendedor cometio n error por lo que se registro una venta y la venta es erronea
Diego le solicita a Jeimmy que le elimine la venta mas reciente a loq ue ella lo hace*/

EXECUTE PA_ADMINISTRADOR.EL_Venta(SEQ_idVenta.CURRVAL - 1);

--Y verifica que se eliminara correctamente 

DECLARE
    CO_Cursor SYS_REFCURSOR;
BEGIN
    CO_Cursor := PA_ADMINISTRADOR.CO_Venta;
    DBMS_SQL.RETURN_RESULT(CO_Cursor);
END;

--En un pedido LLego un nuevo Producto, una serie de motos Exclusivas, a lo que Jeymmi lo registra en la base de datos

EXECUTE PC_PRODUCTOS.AD_Motos('M11', 'Kawasaki H2', 210000000, 0, 'M', 'D', 'Kawasaki', 'H2', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'Rojo', '1250', 'Moto Kawasaki H2 Exclusiva Colombia');

--Posterior le pide a Diego que registre una Compra de la moto

BEGIN
    --Compra
    PC_COMPRAS.AD_Compra(5, 1000093114, 'A', 'Compra de Moto Exclusiva Kawasaki H2');
    --DetallesComptas
    PC_COMPRAS.AD_DetalleCompra(SEQ_idCompra.CURRVAL, 'M11', 2, 210000000);
END;
/

--Jeiimy Verifica que se haya registrado correctamente

DECLARE
    CO_Cursor SYS_REFCURSOR;
BEGIN
    CO_Cursor := PA_ADMINISTRADOR.CO_Compra;
    DBMS_SQL.RETURN_RESULT(CO_Cursor);
END;
/

--El gerente le dice uque le haga un informe de los Empleados que mas han vedido en el año para una compesacion

DECLARE
    CO_Cursor SYS_REFCURSOR;
BEGIN
    CO_Cursor := PA_GERENTE.CO_VentasEmpleados;
    DBMS_SQL.RETURN_RESULT(CO_Cursor);
END;
/

-- Tambien para clientes

DECLARE
    CO_Cursor SYS_REFCURSOR;
BEGIN
    CO_Cursor := PA_GERENTE.CO_VentasClientes;
    DBMS_SQL.RETURN_RESULT(CO_Cursor);
END;
/
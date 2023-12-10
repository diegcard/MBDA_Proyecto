--Historias

--Diego Cardenas
/*
Digo es un Empleado de la empresa el tiene el rol de Vendedor
El el dia de hoy tuvo un dia un poco pesado y registro unas 5 5 de las cuales todas fueron exitosas
El quiere almacenar todo en la base de datos, primero el inicia session en la base de datos
Le pide al administrador que cree el usurio para el
porteriormente el ingresa los datos de la Venta y el sistema lo almacena en la base de datos
*/

--Creacion del usuario 

EXECUTE PA_ADMINISTRADOR.AD_Empleado (1000093114, 'C.C', 'Diego', 'Cardenas', 'Auto Norte 104', 'Diego@gmail.com', 'H', 'D', 'Vendedor', 3500000);

-- Es un cliente Nuevo por ende Crea El Perfil del Cliente



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
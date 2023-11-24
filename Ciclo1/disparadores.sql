/*---------------------------------Mantener Personas---------------------------------*/
/*-----Adicion-----*/
/*-----Modificacion-----*/
/*-----Eliminacion-----*/
--Cuando se elimina una persona, se elimina de la tabla Clientes o Empleados

/*---------------------------------Mantener Ventas---------------------------------*/
/*-----Adicion-----*/
-- La fecha y Hora se ponen automaticamente en la inserccion de datos
CREATE OR REPLACE TRIGGER TR_Ventas_BI_Default
BEFORE INSERT ON Ventas
FOR EACH ROW
BEGIN
  :NEW.fechaVenta := systimestamp;  
  :NEW.totalVenta := 0;
END;
/

-- Calcula precioTotal automaticamente multiplicando el precioUnitario y la cantidad 
CREATE OR REPLACE TRIGGER TR_DetallesVentas_totalVenta_BI
BEFORE INSERT ON DetallesVentas
FOR EACH ROW
DECLARE
    total NUMBER(20,2) := :NEW.precioUnitario * :NEW.cantidad;
BEGIN
  :NEW.precioTotal := total;
END;
/

-- Descontar cantidad automaticamente de la tabla productos de un articulo vendido
CREATE OR REPLACE TRIGGER TR_DetallesVentas_cantidad_recontar_AI
AFTER INSERT ON DetallesVentas
FOR EACH ROW
BEGIN
  UPDATE Productos P
  SET P.cantidadEnStock = P.cantidadEnStock - :NEW.cantidad
  WHERE P.idProducto = :NEW.idProducto;
END;  
/

-- En la tabla Ventas en el atributo totalventa se calcula, sumando todos los detalles ventas asociados a dicha factura
CREATE OR REPLACE TRIGGER TR_DeatllesVentas_AI_totalVenta
AFTER INSERT ON DetallesVentas
BEGIN
    UPDATE Ventas v
    SET totalVenta = (SELECT SUM(d.precioTotal)
                      FROM DetallesVentas d
                      WHERE d.idVenta = v.idVenta)
    WHERE v.idVenta IN (SELECT DISTINCT idVenta FROM DetallesVentas);
END;
/

/*-----Modificacion-----*/
-- No se puedene modificar los atributos

/*-----Eliminacion-----*/
/*
Preguntar
*/
--Cuando se elimina una venta se eliminan los detallesVentas asociados con dicha venta
--Eso esta implementado en las acciones

/*---------------------------------Mantener Productos---------------------------------*/

/*-----Adicion-----*/
/*-----Modificacion-----*/
--El precio tiene que ser positivo (Esto es un check ya realizado)
/*-----Eliminacion-----*/
--Cuando se elimina un producto se eliminan las herencias asociados con dicho producto
--Eso esta implementado en las acciones
--Cuando se elimina un producto en DetallesVentas se establece el id del producto como NULL

/*---------------------------------Mantener Compras---------------------------------*/
/*-----Adicion-----*/
-- La fecha y Hora se ponen automaticamente en la inserccion de datos
CREATE OR REPLACE TRIGGER TR_Compras_BI_Default
BEFORE INSERT ON Compras
FOR EACH ROW
BEGIN
  :NEW.fecha := SYSDATE;  
  :NEW.totalCompra := 0;
END;
/

-- Calcula precioTotal automaticamente multiplicando el precioUnitario y la cantidad 
CREATE OR REPLACE TRIGGER TR_DetallesCompras_subtotal_BI
BEFORE INSERT ON DetallesCompras
FOR EACH ROW
DECLARE
    total NUMBER(20,2) := :NEW.precioUnitario * :NEW.cantidad;
BEGIN
    :NEW.subtotal := total;
END;
/

-- En la tabla Compras en el atributo totalCompra se calcula, sumando todos los DetallesCompras asociados a dicha compra
CREATE OR REPLACE TRIGGER TR_DetallesCompras_AI_subtotal
AFTER INSERT ON DetallesCompras
BEGIN
    UPDATE Compras v
    SET totalCompra = (SELECT SUM(d.subtotal)
                      FROM DetallesCompras d
                      WHERE d.idCompra = v.idCompra)
    WHERE v.idCompra IN (SELECT DISTINCT idCompra FROM DetallesCompras);
END;
/

-- Adicionar cantidad automaticamente de la tabla productos de un articulo Comprado
CREATE OR REPLACE TRIGGER TR_DetallesCompras_cantidad_recontar_AI
AFTER INSERT ON DetallesCompras
FOR EACH ROW
BEGIN
  UPDATE Productos P
  SET P.cantidadEnStock = P.cantidadEnStock + :NEW.cantidad
  WHERE P.idProducto = :NEW.idProducto;
END;
/

/*-----Modificacion-----*/
-- No se pueden modificar las Compras
/*-----Eliminacion-----*/
--Cuando se elimina una Compra se eliminan los detallesCompras asociadas a dicha Compra
--Es una accion y ya esta implementada
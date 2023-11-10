/*---------------------------------Mantener Personas---------------------------------*/
/*-----Adicion-----*/
/*-----Modificacion-----*/
/*-----Eliminacion-----*/
--Cuando se elimina una persona, se elimina de la tabla Clientes o Empleados

/*---------------------------------Mantener Ventas---------------------------------*/
/*-----Adicion-----*/
-- La fecha y Hora se ponen automaticamente en la inserccion de datos
CREATE OR REPLACE TRIGGER TR_Ventas_In_Be_Default
BEFORE INSERT ON Ventas
FOR EACH ROW
BEGIN
  :NEW.fechaVenta := SYSDATE;  
  :NEW.horaVenta := CURRENT_TIMESTAMP;
  :NEW.totalVenta := 0;
END;
/

-- Calcula precioTotal automaticamente multiplicando el precioUnitario y la cantidad 
CREATE OR REPLACE TRIGGER TR_DetallesVentas_totalVenta_BE_IN
BEFORE INSERT ON DetallesVentas
FOR EACH ROW
DECLARE
    total NUMBER(20,2) := :NEW.precioUnitario * :NEW.cantidad;
BEGIN
  :NEW.precioTotal := total;
END;
/

-- Descontar cantidad automaticamente de la tabla productos de un articulo vendido
CREATE OR REPLACE TRIGGER TR_DetallesVentas_cantidad_recontar
AFTER INSERT ON DetallesVentas
FOR EACH ROW
BEGIN
  UPDATE Productos P
  SET P.cantidadEnStock = P.cantidadEnStock - :NEW.cantidad
  WHERE P.idProducto = :NEW.idProducto;
END;  
/

-- En la tabla Ventas en el atributo totalventa se calcula, sumando todos los detalles ventas asociados a dicha factura
CREATE OR REPLACE TRIGGER TR_DeatllesVentas_AF_IN_UP_DE_totalVenta
AFTER INSERT OR UPDATE OR DELETE ON DetallesVentas
BEGIN
    UPDATE Ventas v
    SET totalVenta = (SELECT SUM(d.precioTotal)
                      FROM DetallesVentas d
                      WHERE d.idVenta = v.idVenta)
    WHERE v.idVenta IN (SELECT DISTINCT idVenta FROM DetallesVentas);
END;
/

/*-----Modificacion-----*/
-- El unico Dato que se puede modificar en Ventas es la descripcion 
CREATE OR REPLACE TRIGGER TR_Ventas_Ud_Be_Se
BEFORE UPDATE ON Ventas
FOR EACH ROW
BEGIN
  IF UPDATING('idVenta') OR UPDATING('fechaVenta') OR UPDATING('horaVenta') THEN
    RAISE_APPLICATION_ERROR(-20001, 'No se permite modificar dichos atributos excepto.');
  END IF;
END;
/

-- El unico Dato que se puede modificar en detallesVentas es la descripcion 
CREATE OR REPLACE TRIGGER TR_DetallesVentas_Ud_Be_Se
BEFORE UPDATE ON DetallesVentas
FOR EACH ROW
BEGIN
  IF UPDATING('idDetalleVenta') OR UPDATING('idVenta') THEN
    RAISE_APPLICATION_ERROR(-20002, 'No se permite modificar los atributos.');
  END IF;
END;
/

/*-----Eliminacion-----*/
--Cuando se elimina una venta se eliminan los detallesVentas asociados con dicha venta
--Eso esta implementado en las acciones

/*---------------------------------Mantener Productos---------------------------------*/

/*-----Adicion-----*/
--Crea el id automaticamente
/*
----------VERIFICAR
CREATE OR REPLACE TRIGGER TR_Productos_id_In_Be
BEFORE INSERT ON Productos
FOR EACH ROW
DECLARE
  tip CHAR(1) := :NEW.tipoProducto;
BEGIN
  IF tip = 'R' THEN
    :NEW.idProducto := 'R' || Producto_id_Repuesto.NEXTVAL;
  ELSIF tip = 'M' THEN
    :NEW.idProducto := 'M' || Producto_id_Moto.NEXTVAL;
  ELSIF tip = 'A' THEN
    :NEW.idProducto := 'A' || Producto_id_Accesorio.NEXTVAL;
  END IF;
END;
/
*/

/*-----Modificacion-----*/
--El precio tiene que ser positivo (Esto es una accion ya realizada)
/*-----Eliminacion-----*/
--Cuando se elimina un producto se eliminan las herencias asociados con dicho producto
--Eso esta implementado en las acciones
--Cuando se elimina un producto en DetallesVentas se establece el id del producto como NULL

/*---------------------------------Mantener Compras---------------------------------*/
/*-----Adicion-----*/
-- La fecha y Hora se ponen automaticamente en la inserccion de datos
CREATE OR REPLACE TRIGGER TR_Compras_In_Be_Default
BEFORE INSERT ON Compras
FOR EACH ROW
BEGIN
  :NEW.fecha := SYSDATE;  
  :NEW.totalCompra := 0;
END;
/

-- Calcula precioTotal automaticamente multiplicando el precioUnitario y la cantidad 
CREATE OR REPLACE TRIGGER TR_DetallesCompras_subtotal_BE_IN
BEFORE INSERT ON DetallesCompras
FOR EACH ROW
DECLARE
    total NUMBER(20,2) := :NEW.precioUnitario * :NEW.cantidad;
BEGIN
    :NEW.subtotal := total;
END;
/

-- En la tabla Compras en el atributo totalCompra se calcula, sumando todos los DetallesCompras asociados a dicha compra
CREATE OR REPLACE TRIGGER TR_DetallesCompras_AF_IN_UP_DE_subtotal
AFTER INSERT OR UPDATE OR DELETE ON DetallesCompras
BEGIN
    UPDATE Compras v
    SET totalCompra = (SELECT SUM(d.subtotal)
                      FROM DetallesCompras d
                      WHERE d.idCompra = v.idCompra)
    WHERE v.idCompra IN (SELECT DISTINCT idCompra FROM DetallesCompras);
END;
/

-- Adicionar cantidad automaticamente de la tabla productos de un articulo Comprado
CREATE OR REPLACE TRIGGER TR_DetallesCompras_cantidad_recontar
AFTER INSERT ON DetallesCompras
FOR EACH ROW
BEGIN
  UPDATE Productos P
  SET P.cantidadEnStock = P.cantidadEnStock + :NEW.cantidad
  WHERE P.idProducto = :NEW.idProducto;
END;
/

/*-----Modificacion-----*/
-- El unico Dato que se puede modificar en Compras es la descripcion y el estado 
CREATE OR REPLACE TRIGGER TR_Compras_Ud_Be_Se
BEFORE UPDATE ON Ventas
FOR EACH ROW
BEGIN
  IF UPDATING('idCompra') OR UPDATING('fechaCompra') THEN
    RAISE_APPLICATION_ERROR(-20003, 'No se permite modificar dichos atributos excepto.');
  END IF;
END;
/

-- El unico Dato que se puede modificar en detallesCompras es la descripcion 
CREATE OR REPLACE TRIGGER TR_DetallesVentas_Ud_Be_Se
BEFORE UPDATE ON DetallesVentas
FOR EACH ROW
BEGIN
  IF UPDATING('idDetalleCompra') OR UPDATING('idCompra') THEN
    RAISE_APPLICATION_ERROR(-20004, 'No se permite modificar los atributos.');
  END IF;
END;
/

/*-----Eliminacion-----*/
--Cuando se elimina una Compra se eliminan los detallesCompras asociadas a dicha Compra
--Es una accion y ya esta implementada
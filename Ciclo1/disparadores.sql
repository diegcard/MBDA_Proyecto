/*---------------------------------Mantener Personas---------------------------------*/
/*-----Adicion-----*/
-- El tipo de identificacion se pone en mayuscula automaticamente
CREATE OR REPLACE TRIGGER TR_Personas_Ve_tipoIde
BEFORE INSERT ON Personas
FOR EACH ROW
BEGIN
  :NEW.tipoIdentificacion := UPPER(:NEW.tipoIdentificacion);
END;
/

/*-----Modificacion-----*/
--Solo se puede modificar la columnas de direccion y correoElectronico
CREATE OR REPLACE TRIGGER TR_Personas_Up_restric_Be
BEFORE UPDATE ON Personas
FOR EACH ROW
BEGIN
  IF :NEW.direccion IS NOT NULL OR :NEW.correoElectronico IS NOT NULL THEN
    IF :NEW.direccion IS NOT NULL AND :NEW.direccion <> :OLD.direccion THEN
      raise_application_error(-20001, 'No se puede modificar la columna dirección.');
    END IF;

    IF :NEW.correoElectronico IS NOT NULL AND :NEW.correoElectronico <> :OLD.correoElectronico THEN
      raise_application_error(-20001, 'No se puede modificar la columna correo electrónico.');
    END IF;
  ELSE
    raise_application_error(-20001, 'No se puede modificar otras columnas aparte de la dirección y el correo electrónico.');
  END IF;
END;
/

/*-----Eliminacion-----*/
--Cuando se elimina una persona, se elimina de la tabla Clientes o Empleados tambien se eliminan los telefonos asociados con dicha persona

/*---------------------------------Mantener Ventas---------------------------------*/
/*-----Adicion-----*/
-- La fecha y Hora se ponen automaticamente en la inserccion de datos
CREATE OR REPLACE TRIGGER TR_Ventas_BI_Default
BEFORE INSERT ON Ventas
FOR EACH ROW
BEGIN
  :NEW.fechaVenta := systimestamp;  
  :NEW.totalVenta := 0;
  IF :NEW.estadoVenta IS NULL THEN
    :NEW.estadoVenta := 'Pendiente';
  END IF;
END;
/

-- Después de insertar una venta se actualiza el estado del producto a No disponible si la cantidad en stock es 0 
CREATE OR REPLACE TRIGGER TR_DetallesVentas_estadoProducto_cero_actualizar_AF
AFTER INSERT ON DetallesVentas
FOR EACH ROW
DECLARE
  v_cantidad NUMBER;
BEGIN
  SELECT P.cantidadEnStock INTO v_cantidad
  FROM Productos P
  WHERE P.idProducto = :NEW.idProducto;
  IF v_cantidad = 0 THEN
    UPDATE Productos P 
    SET P.estadoProducto = 'N'
    WHERE P.idProducto = :NEW.idProducto;
  ELSIF v_cantidad > 0 THEN
    UPDATE Productos P 
    SET P.estadoProducto = 'D'
    WHERE P.idProducto = :NEW.idProducto;
  END IF;
END;
/

-- Un producto solo se puede vender si su estado es Disponible y mayor a 0
CREATE OR REPLACE TRIGGER TR_DetallesVentas_estadoProducto
BEFORE INSERT ON DetallesVentas
FOR EACH ROW
DECLARE
  v_cantidad NUMBER;
  v_estado CHAR;
BEGIN
  SELECT P.cantidadEnStock INTO v_cantidad
  FROM Productos P
  WHERE P.idProducto = :NEW.idProducto;
  
  SELECT estadoProducto INTO v_estado
  FROM Productos P
  WHERE P.idProducto = :NEW.idProducto;

  IF v_cantidad < :NEW.cantidad THEN
    raise_application_error(-20002, 'No se puede vender más de lo que hay en stock.');
  END IF;
  IF v_estado <> 'D' THEN
    raise_application_error(-20003, 'No se puede vender un producto que no esté disponible.');
  END IF;
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
AFTER INSERT OR DELETE ON DetallesVentas
BEGIN
    UPDATE Ventas v
    SET totalVenta = (SELECT SUM(d.precioTotal)
                      FROM DetallesVentas d
                      WHERE d.idVenta = v.idVenta)
    WHERE v.idVenta IN (SELECT DISTINCT idVenta FROM DetallesVentas);
END;
/

/*-----Modificacion-----*/
-- El unico dato que no se puede modificar es fechaVenta
CREATE OR REPLACE TRIGGER TR_Ventas_Up_restric_Be
BEFORE UPDATE ON Ventas
FOR EACH ROW
BEGIN
  IF :NEW.fechaVenta IS NOT NULL THEN
      :OLD.fechaVenta := :NEW.fechaVenta;
  ELSE
      raise_application_error(-20004, 'No se puede modificar la fecha de la venta.');
  END IF;
END;
/

/*-----Eliminacion-----*/
--Cuando se elimina una venta se eliminan los detallesVentas asociados con dicha venta
--Eso esta implementado en las acciones

/*---------------------------------Mantener Productos---------------------------------*/
/*-----Adicion-----*/
--El estado inicial del prodducto en precio es 0 y en cantidadEnStock es 0 y el estado es N
CREATE OR REPLACE TRIGGER TR_Productos_BI_Default
BEFORE INSERT ON Productos
FOR EACH ROW
BEGIN
  IF :NEW.precio IS NULL THEN
    :NEW.precio := 0;
  END IF;

  IF :NEW.estadoProducto IS NULL THEN
    :NEW.estadoProducto := 0;
  END IF;
END;
/


/*-----Modificacion-----*/
--El precio tiene que ser positivo y la cantidad no puede ser negativa (Esto es un check ya realizado)
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
AFTER INSERT OR DELETE ON DetallesCompras
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

  UPDATE Productos P
  SET estadoProducto = 'D'
  WHERE P.idProducto = :NEW.idProducto;
END;
/

/*-----Modificacion-----*/
-- No se pueden modificar las Compras
/*-----Eliminacion-----*/
--Cuando se elimina una Compra se eliminan los detallesCompras asociadas a dicha Compra
--Es una accion y ya esta implementada
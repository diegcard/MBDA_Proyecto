/*---------------------------------Mantener Personas---------------------------------*/
/*-----Adicion-----*/
/*-----Modificacion-----*/
/*-----ELIMINAR-----*/
/*---------------------------------Mantener Ventas---------------------------------*/
/*-----Adicion-----*/

-- La fecha y Hora se ponen automaticamente en la inserccion de datos
CREATE OR REPLACE TRIGGER TR_Ventas_In_Be_Date
BEFORE INSERT ON Ventas
FOR EACH ROW
BEGIN
  :NEW.fechaVenta := SYSDATE;  
  :NEW.horaVenta := CURRENT_TIMESTAMP;
END;
/

/*-----Modificacion-----*/

-- El unico Dato que se puede modificar es la descripcion 
CREATE OR REPLACE TRIGGER TR_Ventas_Ud_Be_Se
BEFORE UPDATE ON Ventas
FOR EACH ROW
BEGIN
  IF UPDATING('idVenta') OR UPDATING('idEmpleado') OR UPDATING('idCliente') OR
     UPDATING('fechaVenta') OR UPDATING('horaVenta') OR UPDATING('totalVenta') THEN
    RAISE_APPLICATION_ERROR(-20001, 'No se permite modificar los atributos excepto "descripcionVenta".');
  END IF;
END;
/

-- En la tabla Ventas en el atributo totalventa se calcula, sumando todos los detllaes ventas asiciados a dicha factura
CREATE OR REPLACE TRIGGER TR_ConceptosVentas_Ud_Be_Recalcular
AFTER INSERT OR DELETE OR UPDATE ON DetallesVentas
FOR EACH ROW
DECLARE
  total_venta NUMBER(20, 2);
BEGIN
  SELECT SUM(precioTotal)
  INTO total_venta
  FROM DetallesVentas
  WHERE idVenta = :NEW.idVenta;

  UPDATE Ventas
  SET totalVenta = total_venta
  WHERE idVenta = :NEW.idVenta;
END;
/

CREATE OR REPLACE TRIGGER calcular_precio_total
BEFORE INSERT OR UPDATE ON DetallesVentas
FOR EACH ROW
BEGIN
  -- Calcula el precioTotal multiplicando el precioUnitario por la cantidad
  :NEW.precioTotal := :NEW.precioUnitario * :NEW.cantidad;
END;
/

/*-----ELIMINAR-----*/
/*---------------------------------Mantener Productos---------------------------------*/
/*---------------------------------Mantener Compras---------------------------------*/
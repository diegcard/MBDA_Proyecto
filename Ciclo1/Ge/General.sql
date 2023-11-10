/*----------Tablas----------*/
/*
Comentarios:
Total de Tablas: 14
Total de Atributos: 69
*/
-- Color Azul


CREATE TABLE Personas(
    idPersona NUMBER(11) NOT NULL,
    nombre VARCHAR2(20) NOT NULL,
    apellidos VARCHAR2(20) NOT NULL,
    identificacion NUMBER(20) NOT NULL,
    tipoIdentificacion CHAR(5) NOT NULL,
    dirrecion VARCHAR2(50) NULL,
    correoElectronico VARCHAR2(50) NOT NULL
);

CREATE TABLE telefonosPersona(
    idPersona NUMBER(11) NOT NULL,
    telefono NUMBER(11) NOT NULL
);

CREATE TABLE Clientes(
    idPersona NUMBER(11) NOT NULL,
    ocupacion VARCHAR2(20) NULL,
    ingresos NUMBER(20,2) NULL, 
    historialCredito NUMBER(10) NULL
);

CREATE TABLE Empleados(
    idPersona NUMBER(11) NOT NULL,
    sexo CHAR(1) NULL,
    etadoCivil CHAR(1) NULL,
    cargo VARCHAR2(15) NOT NULL,
    salario NUMBER(20,2) NOT NULL
);

-- Color Verde

CREATE TABLE Ventas(
    idVenta NUMBER(20) NOT NULL,
    idEmpleado NUMBER(11) NULL,
    idCliente NUMBER(11) NULL,
    fechaVenta DATE NOT NULL,
    horaVenta TIMESTAMP NOT NULL,
    totalVenta NUMBER(20,2) NULL,
    descripcionVenta VARCHAR2(200) NULL
);

CREATE TABLE DetallesVentas(
    idDetalleVenta NUMBER(20) NOT NULL,
    idVenta NUMBER(20) NOT NULL,
    idProducto VARCHAR2(10) NULL,
    cantidad NUMBER(20) NULL,
    precioUnitario NUMBER(20,2) NULL,
    precioTotal NUMBER(20,2) NULL
);

-- Color Naranja

CREATE TABLE Productos(
    idProducto VARCHAR2(10) NOT NULL,
    nombre VARCHAR2(50) NOT NULL,
    precio NUMBER(20,2) NOT NULL,
    cantidadEnStock NUMBER(10) NOT NULL,
    tipoProducto CHAR(1) NOT NULL
);

CREATE TABLE Repuestos(
    idProducto VARCHAR2(10) NOT NULL,
    tipo VARCHAR2(20) NULL,
    descripcion VARCHAR2(200) NULL
);

CREATE TABLE Motos(
    idProducto VARCHAR2(10) NOT NULL,
    marca VARCHAR2(20) NULL,
    modelo VARCHAR2(20) NOT NULL,
    anio DATE NULL,
    color VARCHAR2(100) NOT NULL,
    cilindraje NUMBER(4) NOT NULL,
    descripcion VARCHAR2(200) NULL
);

CREATE TABLE Accesorios(
    idProducto VARCHAR2(10) NOT NULL,
    descripcion VARCHAR(200) NULL
);

-- Color Morado

CREATE TABLE DetallesCompras(
    idDetalleCompra NUMBER(10) NOT NULL,
    idCompra NUMBER(20) NOT NULL,
    idProducto VARCHAR2(10) NOT NULL,
    cantidad NUMBER(3) NOT NULL,
    precioUnitario NUMBER(20,2) NOT NULL,
    subtotal NUMBER(20,2) NULL
);

CREATE TABLE Compras(
    idCompra NUMBER(20) NOT NULL,
    idProveedor VARCHAR2(10) NULL,
    idEmpleado NUMBER(11) NULL,
    fecha DATE NOT NULL,
    totalCompra NUMBER(20,2) NULL,
    estadoCompra CHAR(1) NOT NULL,
    descripcionCompra VARCHAR2(200) NULL
);

CREATE TABLE Proveedores(
    idProveedor VARCHAR2(10) NOT NULL,
    nombre VARCHAR2(50) NOT NULL,
    direccion VARCHAR(100) NULL,
    correoElectronico VARCHAR(50) NOT NULL,
    informacionContacto VARCHAR(200) NULL
);

CREATE TABLE telefonosProveedores(
    idProveedor VARCHAR2(10) NOT NULL,
    telefono NUMBER(10) NOT NULL
);


/*--------------------Atributos--------------------*/
/*
Comentarios:
Total de llaves primarias: 14
Total de llaves unicas: 4
Total de llaves foraneas: 15
Total de Checks: 10
*/
/*----------Primary Keys----------*/--
-- Color Azul
ALTER TABLE Personas ADD CONSTRAINT PK_Personas PRIMARY KEY(idPersona);
ALTER TABLE telefonosPersona ADD CONSTRAINT PK_telefonosPersona PRIMARY KEY(idPersona, telefono);
ALTER TABLE Clientes ADD CONSTRAINT PK_Clientes PRIMARY KEY(idPersona);
ALTER TABLE Empleados ADD CONSTRAINT PK_Empleados PRIMARY KEY(idPersona);

-- Color Verde
ALTER TABLE Ventas ADD CONSTRAINT PK_Ventas PRIMARY KEY(idVenta);
ALTER TABLE DetallesVentas ADD CONSTRAINT PK_DetallesVentas PRIMARY KEY(idDetalleVenta);

-- Color Naranja
ALTER TABLE Productos ADD CONSTRAINT PK_Productos PRIMARY KEY(idProducto);
ALTER TABLE Motos ADD CONSTRAINT PK_Motos PRIMARY KEY(idProducto);
ALTER TABLE Repuestos ADD CONSTRAINT PK_Repuestos PRIMARY KEY(idProducto);
ALTER TABLE Accesorios ADD CONSTRAINT PK_Accesorios PRIMARY KEY(idProducto);

-- Color Morado
ALTER TABLE Proveedores ADD CONSTRAINT PK_Proveedores PRIMARY KEY(idProveedor);
ALTER TABLE telefonosProveedores ADD CONSTRAINT PK_AtelefonosProveedores PRIMARY KEY(idProveedor, telefono);
ALTER TABLE DetallesCompras ADD CONSTRAINT PK_idDetalleCompra PRIMARY KEY(idDetalleCompra);
ALTER TABLE Compras ADD CONSTRAINT PK_Compras PRIMARY KEY(idCompra);

/*----------UNIQUE KEYS----------*/
-- Color Azul
ALTER TABLE Personas ADD CONSTRAINT UK_Personas_Id_tId UNIQUE (identificacion, tipoIdentificacion);
ALTER TABLE Personas ADD CONSTRAINT UK_Personas_correoElectronico UNIQUE (correoElectronico);

-- Color Morado
ALTER TABLE Proveedores ADD CONSTRAINT UK_Proveedores_nombre UNIQUE (nombre);
ALTER TABLE Proveedores ADD CONSTRAINT UK_Proveedores_correoElectronico UNIQUE (correoElectronico);

/*----------Cheks----------*/
-- Color Azul
ALTER TABLE Personas ADD CONSTRAINT CK_Personas_identificacion CHECK (REGEXP_LIKE(identificacion, '^[0-9]+$'));
ALTER TABLE Personas ADD CONSTRAINT CK_Personas_tipoIdentificacion CHECK (tipoIdentificacion IN('C.C', 'T.I', 'C.E', 'P.P'));
ALTER TABLE Personas ADD CONSTRAINT CK_Personas_Correo CHECK(correoElectronico LIKE '%@%');
ALTER TABLE Empleados ADD CONSTRAINT CK_Empleados_Sex CHECK(sexo IN('H', 'M', 'O'));
ALTER TABLE Empleados ADD CONSTRAINT CK_Empleados_Ecivil CHECK(etadoCivil IN('S', 'C', 'V', 'D', 'U'));

-- Color Verde
-- ALTER TABLE DetallesVentas ADD CONSTRAINT CK_DetallesVentas_cantidad CHECK(cantidad > 0);

--Color Naranja
ALTER TABLE Productos ADD CONSTRAINT CK_Productos_tipoProducto CHECK(tipoProducto IN('R', 'M', 'A'));
ALTER TABLE Productos ADD CONSTRAINT CK_Productos_precio CHECK(precio >= 0):

--Color Morado
-- ALTER TABLE DetallesCompras ADD CONSTRAINT CK_DetallesCompras_cantidad CHECK(cantidad > 0 and REGEXP_LIKE(cantidad, '^[0-9]+$'));
ALTER TABLE Compras ADD CONSTRAINT CK_Compras_Ecompra CHECK(estadoCompra IN('P','A', 'R', 'E', 'C', 'F', 'T'));
ALTER TABLE Proveedores ADD CONSTRAINT CK_Proveedores_Correo CHECK(correoElectronico LIKE '%@%');

/*----------FOREIGN KEYS----------*/
-- Color Azul
ALTER TABLE telefonosPersona ADD CONSTRAINT FK_telefonosPersona_idPersona FOREIGN KEY(idPersona) REFERENCES Personas(idPersona);
ALTER TABLE Clientes ADD CONSTRAINT FK_Clientes FOREIGN KEY(idPersona) REFERENCES Personas(idPersona);
ALTER TABLE Empleados ADD CONSTRAINT FK_Empleados FOREIGN KEY(idPersona) REFERENCES Personas(idPersona);

-- Color Verde
ALTER TABLE Ventas ADD CONSTRAINT FK_Ventas_idEmpleado FOREIGN KEY(idEmpleado) REFERENCES Empleados(idPersona);
ALTER TABLE Ventas ADD CONSTRAINT FK_Ventas_idCliente FOREIGN KEY(idCliente) REFERENCES Clientes(idPersona);
ALTER TABLE DetallesVentas ADD CONSTRAINT FK_DetallesVentas_idVenta FOREIGN KEY(idVenta) REFERENCES Ventas(idVenta);
ALTER TABLE DetallesVentas ADD CONSTRAINT FK_DetallesVentas_idProducto FOREIGN KEY(idProducto) REFERENCES Productos(idProducto);

-- Color Naranja
ALTER TABLE Repuestos ADD CONSTRAINT FK_Repuestos_Productos_id FOREIGN KEY(idProducto) REFERENCES Productos(idProducto);
ALTER TABLE Motos ADD CONSTRAINT FK_Motos_Productos_id FOREIGN KEY(idProducto) REFERENCES Productos(idProducto);
ALTER TABLE Accesorios ADD CONSTRAINT FK_Accesorios_Productos_id FOREIGN KEY(idProducto) REFERENCES Productos(idProducto);

-- Color Morado
ALTER TABLE telefonosProveedores ADD CONSTRAINT FK_telefonosProveedores_id FOREIGN KEY(idProveedor) REFERENCES Proveedores(idProveedor);
ALTER TABLE DetallesCompras ADD CONSTRAINT FK_DetallesCompras_idCompra FOREIGN KEY(idCompra) REFERENCES Compras(idCompra);
ALTER TABLE DetallesCompras ADD CONSTRAINT FK_DetallesCompras_idProducto FOREIGN KEY(idProducto) REFERENCES Productos(idProducto);
ALTER TABLE Compras ADD CONSTRAINT FK_Compras_idProveedor FOREIGN KEY(idProveedor) REFERENCES Proveedores(idProveedor);
ALTER TABLE Compras ADD CONSTRAINT FK_Compras_idEmpleado FOREIGN KEY(idEmpleado) REFERENCES Empleados(idPersona);


/*---------------------------------Mantener Personas---------------------------------*/
/*XAcciones de referencia*/
ALTER TABLE telefonosPersona DROP CONSTRAINT FK_telefonosPersona_idPersona;
ALTER TABLE Clientes DROP CONSTRAINT FK_Clientes;
ALTER TABLE Empleados DROP CONSTRAINT FK_Empleados;
/*Acciones de referencia*/
ALTER TABLE telefonosPersona ADD CONSTRAINT FK_telefonosPersona_idPersona FOREIGN KEY(idPersona) REFERENCES Personas(idPersona) ON DELETE CASCADE;
ALTER TABLE Clientes ADD CONSTRAINT FK_Clientes FOREIGN KEY(idPersona) REFERENCES Personas(idPersona) ON DELETE CASCADE;
ALTER TABLE Empleados ADD CONSTRAINT FK_Empleados FOREIGN KEY(idPersona) REFERENCES Personas(idPersona) ON DELETE CASCADE;

/*---------------------------------Mantener Ventas---------------------------------*/

/*XAcciones de referencia*/
ALTER TABLE Ventas DROP CONSTRAINT FK_Ventas_idEmpleado;
ALTER TABLE Ventas DROP CONSTRAINT FK_Ventas_idCliente;
ALTER TABLE DetallesVentas DROP CONSTRAINT FK_DetallesVentas_idVenta;
ALTER TABLE DetallesVentas DROP CONSTRAINT FK_DetallesVentas_idProducto;
/*Acciones de referencia*/
ALTER TABLE Ventas ADD CONSTRAINT FK_Ventas_idEmpleado FOREIGN KEY(idEmpleado) REFERENCES Empleados(idPersona) ON DELETE SET NULL;
ALTER TABLE Ventas ADD CONSTRAINT FK_Ventas_idCliente FOREIGN KEY(idCliente) REFERENCES Clientes(idPersona) ON DELETE SET NULL;
ALTER TABLE DetallesVentas ADD CONSTRAINT FK_DetallesVentas_idVenta FOREIGN KEY(idVenta) REFERENCES Ventas(idVenta) ON DELETE CASCADE;
ALTER TABLE DetallesVentas ADD CONSTRAINT FK_DetallesVentas_idProducto FOREIGN KEY(idProducto) REFERENCES Productos(idProducto) ON DELETE SET NULL;

/*---------------------------------Mantener Productos---------------------------------*/
/*XAcciones de referencia*/
--ALTER TABLE Productos DROP
ALTER TABLE Repuestos DROP CONSTRAINT FK_Repuestos_Productos_id;
ALTER TABLE Motos DROP CONSTRAINT FK_Motos_Productos_id;
ALTER TABLE Accesorios DROP CONSTRAINT FK_Accesorios_Productos_id;
/*Acciones de referencia*/
ALTER TABLE Repuestos ADD CONSTRAINT FK_Repuestos_Productos_id FOREIGN KEY(idProducto) REFERENCES Productos(idProducto) ON DELETE CASCADE;
ALTER TABLE Motos ADD CONSTRAINT FK_Motos_Productos_id FOREIGN KEY(idProducto) REFERENCES Productos(idProducto) ON DELETE CASCADE;
ALTER TABLE Accesorios ADD CONSTRAINT FK_Accesorios_Productos_id FOREIGN KEY(idProducto) REFERENCES Productos(idProducto) ON DELETE CASCADE;

/*---------------------------------Mantener Compras---------------------------------*/
/*XAcciones de referencia*/
ALTER TABLE telefonosProveedores DROP CONSTRAINT FK_telefonosProveedores_id;
ALTER TABLE DetallesCompras DROP CONSTRAINT FK_DetallesCompras_idCompra;
ALTER TABLE DetallesCompras DROP CONSTRAINT FK_DetallesCompras_idProducto;
ALTER TABLE Compras DROP CONSTRAINT FK_Compras_idProveedor;
ALTER TABLE Compras DROP CONSTRAINT FK_Compras_idEmpleado;
/*Acciones de referencia*/
ALTER TABLE telefonosProveedores ADD CONSTRAINT FK_telefonosProveedores_id FOREIGN KEY(idProveedor) REFERENCES Proveedores(idProveedor) ON DELETE CASCADE;
ALTER TABLE DetallesCompras ADD CONSTRAINT FK_DetallesCompras_idCompra FOREIGN KEY(idCompra) REFERENCES Compras(idCompra) ON DELETE CASCADE;
ALTER TABLE DetallesCompras ADD CONSTRAINT FK_DetallesCompras_idProducto FOREIGN KEY(idProducto) REFERENCES Productos(idProducto) ON DELETE SET NULL;
ALTER TABLE Compras ADD CONSTRAINT FK_Compras_idProveedor FOREIGN KEY(idProveedor) REFERENCES Proveedores(idProveedor) ON DELETE SET NULL;
ALTER TABLE Compras ADD CONSTRAINT FK_Compras_idEmpleado FOREIGN KEY(idEmpleado) REFERENCES Empleados(idPersona) ON DELETE SET NULL;


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


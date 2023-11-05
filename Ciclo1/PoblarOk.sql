/*----------PoblarOK----------*/
-- Personas
INSERT INTO Personas (idPersona, nombre, apellidos, identificacion, tipoIdentificacion, dirrecion, correoElectronico)
VALUES (1, 'Juan', 'Perez', '1023456789', 'C.C', 'Calle 1 #2-3', 'juan@gmail.com');
INSERT INTO Personas (idPersona, nombre, apellidos, identificacion, tipoIdentificacion, dirrecion, correoElectronico)
VALUES (2, 'Maria', 'Gomez', '1098765432', 'C.C', 'Calle 2 #4-5', 'maria@gmail.com');
INSERT INTO Personas (idPersona, nombre, apellidos, identificacion, tipoIdentificacion, dirrecion, correoElectronico)
VALUES (3, 'Pedro', 'Lopez', '1045678912', 'C.C', 'Calle 3 #6-7', 'pedro@gmail.com');
INSERT INTO Personas (idPersona, nombre, apellidos, identificacion, tipoIdentificacion, dirrecion, correoElectronico)
VALUES (4, 'Ana', 'Sanchez', '1023159357', 'C.C', 'Calle 4 #8-9', 'ana@gmail.com');
INSERT INTO Personas (idPersona, nombre, apellidos, identificacion, tipoIdentificacion, dirrecion, correoElectronico)
VALUES (5, 'Andres', 'Paez', '1021546879', 'C.C', 'Calle 5 #10-11', 'andres@gmail.com');
INSERT INTO Personas (idPersona, nombre, apellidos, identificacion, tipoIdentificacion, dirrecion, correoElectronico)
VALUES (6, 'Valentina', 'Perez', '831364564', 'C.C', 'Calle 1 #2-3', 'Valentina@gmail.com');
INSERT INTO Personas (idPersona, nombre, apellidos, identificacion, tipoIdentificacion, dirrecion, correoElectronico)
VALUES (7, 'Diego', 'Gomez', '654654', 'C.C', 'Calle 2 #4-5', 'Diego@gmail.com');
INSERT INTO Personas (idPersona, nombre, apellidos, identificacion, tipoIdentificacion, dirrecion, correoElectronico)
VALUES (8, 'Julian', 'Valderrma', '464567', 'C.C', 'Calle 3 #6-7', 'Julian@gmail.com');
INSERT INTO Personas (idPersona, nombre, apellidos, identificacion, tipoIdentificacion, dirrecion, correoElectronico)
VALUES (9, 'Samuel', 'Cardenas', '4687678687', 'C.C', 'Calle 4 #8-9', 'Samuel@gmail.com');
INSERT INTO Personas (idPersona, nombre, apellidos, identificacion, tipoIdentificacion, dirrecion, correoElectronico)
VALUES (10, 'Antonio', 'Paez', '67867687687', 'C.C', 'Calle 5 #10-11', 'Antonio@gmail.com');


--telefonosPersonas
INSERT INTO telefonosPersona (idPersona, telefono)
VALUES (1, '3001234567');
INSERT INTO telefonosPersona (idPersona, telefono)
VALUES (2, '3007654321');
INSERT INTO telefonosPersona (idPersona, telefono)
VALUES (3, '3001597531');
INSERT INTO telefonosPersona (idPersona, telefono)
VALUES (4, '3003579514');
INSERT INTO telefonosPersona (idPersona, telefono)
VALUES (5, '3009541268');
INSERT INTO telefonosPersona (idPersona, telefono)
VALUES (6, '3001234567');
INSERT INTO telefonosPersona (idPersona, telefono)
VALUES (7, '3001456987');
INSERT INTO telefonosPersona (idPersona, telefono)
VALUES (8, '30069874587');
INSERT INTO telefonosPersona (idPersona, telefono)
VALUES (9, '30065841238');
INSERT INTO telefonosPersona (idPersona, telefono)
VALUES (10, '3145698745');

--Clientes
INSERT INTO Clientes (idPersona, ocupacion, ingresos, historialCredito)
VALUES (1, 'Ingeniero', 500000, 80);
INSERT INTO Clientes (idPersona, ocupacion, ingresos, historialCredito)
VALUES (2, 'Medico', 800000, 90);
INSERT INTO Clientes (idPersona, ocupacion, ingresos, historialCredito)
VALUES (3, 'Contador', 600000, 70);
INSERT INTO Clientes (idPersona, ocupacion, ingresos, historialCredito)
VALUES (4, 'Enfermera', 400000, 85);
INSERT INTO Clientes (idPersona, ocupacion, ingresos, historialCredito)
VALUES (5, 'Profesor', 350000, 60);

-- Empleados
INSERT INTO Empleados (idPersona, sexo, etadoCivil, cargo, salario)
VALUES (6, 'M', 'S', 'Vendedor', 1200000);
INSERT INTO Empleados (idPersona, sexo, etadoCivil, cargo, salario)
VALUES (7, 'H', 'C', 'Vendedor', 1500000);
INSERT INTO Empleados (idPersona, sexo, etadoCivil, cargo, salario)
VALUES (8, 'M', 'V', 'Mecanico', 1000000);
INSERT INTO Empleados (idPersona, sexo, etadoCivil, cargo, salario)
VALUES (9, 'M', 'S', 'Administrador', 900000);
INSERT INTO Empleados (idPersona, sexo, etadoCivil, cargo, salario)
VALUES (10, 'H', 'C', 'Gerente', 200000000);

-- Productos
INSERT INTO Productos (idProducto, nombre, precio, cantidadEnStock, tipoProducto)
VALUES ('M1', 'Moto RX150', 500000, 5, 'M');
INSERT INTO Productos (idProducto, nombre, precio, cantidadEnStock, tipoProducto)
VALUES ('R1', 'Disco de freno', 20000, 15, 'R');
INSERT INTO Productos (idProducto, nombre, precio, cantidadEnStock, tipoProducto)
VALUES ('R2', 'Llanta', 75000, 10, 'R');
INSERT INTO Productos (idProducto, nombre, precio, cantidadEnStock, tipoProducto)
VALUES ('A1', 'Casco', 50000, 20, 'A');
INSERT INTO Productos (idProducto, nombre, precio, cantidadEnStock, tipoProducto)
VALUES ('A2', 'Guantes', 30000, 15, 'A');

-- Motos
INSERT INTO Motos (idProducto, marca, modelo, anio, color, cilindraje, descripcion)
VALUES ('M1', 'Yamaha', 'DT125', DATE '2021-07-15', 'Azul', 125, 'Moto todo terreno 125cc');

-- Repuestos
INSERT INTO Repuestos (idProducto, tipo, descripcion)
VALUES ('R1', 'Frenos', NULL);
INSERT INTO Repuestos (idProducto, tipo, descripcion)
VALUES ('R2', 'Neumatico', NULL);

-- Accesorios
INSERT INTO Accesorios (idProducto, descripcion)
VALUES ('A1', 'Casco cerrado color negro');
INSERT INTO Accesorios (idProducto, descripcion)
VALUES ('A2', NULL);


-- Ventas 
INSERT INTO Ventas (idVenta, idEmpleado, idCliente, descripcionVenta)
VALUES ('1', 6, 1, 'Venta de moto');

INSERT INTO Ventas (idVenta, idEmpleado, idCliente, fechaVenta, horaVenta, totalVenta, descripcionVenta)
VALUES ('2', 7, 3, '13-FEB-2023', TIMESTAMP '2023-02-01 12:00:00', 300000, NULL);


-- DetallesVentas
INSERT INTO DetallesVentas (idDetalleVenta, idVenta, idProducto, cantidad, precioUnitario, precioTotal)
VALUES ('1', '1', 'M1', 1, 500000, 500000);

INSERT INTO DetallesVentas (idDetalleVenta, idVenta, idProducto, cantidad, precioUnitario, precioTotal)
VALUES ('2', '2', 'A1', 2, 50000, 100000);
INSERT INTO DetallesVentas (idDetalleVenta, idVenta, idProducto, cantidad, precioUnitario, precioTotal)
VALUES ('3', '2', 'R1', 10, 20000, 200000);

-- Proveedores
INSERT INTO Proveedores (idProveedor, nombre, direccion, correoElectronico, informacionContacto)
VALUES ('1', 'Frenos SA', 'Calle 15 # 20-30', 'frenos@gmail.com', 'John Doe 3002314512');
INSERT INTO Proveedores (idProveedor, nombre, direccion, correoElectronico, informacionContacto)
VALUES ('2', 'Motos y Cia', 'Diag 25 # 15-45', 'motosycia@gmail.com', 'Maria Rodriguez 3007523251');
INSERT INTO Proveedores (idProveedor, nombre, direccion, correoElectronico, informacionContacto)
VALUES ('3', 'Safety Helmets', 'Calle 13 # 7-15', 'helmets@gmail.com', 'Juana Perez 3204569875');
INSERT INTO Proveedores (idProveedor, nombre, direccion, correoElectronico, informacionContacto)
VALUES ('4', 'Llantas Go', 'Calle 3 # 1-30', 'llantasgo@outlook.com', 'Pedro Lopez 3205684125');
INSERT INTO Proveedores (idProveedor, nombre, direccion, correoElectronico, informacionContacto)
VALUES ('5', 'Guantes Top', 'Carrera 7 # 22-15', 'guantes@hotmail.com', 'Luis Torres 3507894561');
INSERT INTO telefonosProveedores (idProveedor, telefono)
VALUES ('1', '3004567215');
INSERT INTO telefonosProveedores (idProveedor, telefono)
VALUES ('2', '3007538992');
INSERT INTO telefonosProveedores (idProveedor, telefono)
VALUES ('3', '3004597812');
INSERT INTO telefonosProveedores (idProveedor, telefono)
VALUES ('4', '3005684993');
INSERT INTO telefonosProveedores (idProveedor, telefono)
VALUES ('5', '3009871537');

-- Compas

INSERT INTO Compras (idCompra, idProveedor, idEmpleado, fecha, totalCompra, estadoCompra, descripcionCompra)
VALUES ('1', '1', 6,DATE '2021-01-15', 750000, 'C', 'Compra de discos de freno');

INSERT INTO Compras (idCompra, idProveedor, idEmpleado, fecha, totalCompra, estadoCompra, descripcionCompra)
VALUES ('2', '2', 8, DATE '2022-05-20', 4500000, 'F', 'Compra de motos RX150');

-- DetallesCompras
INSERT INTO DetallesCompras (idDetalleCompra, idCompra, idProducto, cantidad, precioUnitario, subtotal)
VALUES ('1', '1', 'R1', 50, 15000, 750000);

INSERT INTO DetallesCompras (idDetalleCompra, idCompra, idProducto, cantidad, precioUnitario, subtotal)
VALUES ('2', '2', 'M1', 10, 450000, 4500000);
INSERT INTO DetallesCompras (idDetalleCompra, idCompra, idProducto, cantidad, precioUnitario, subtotal)
VALUES ('3', '2', 'M1', 10, 450000, 4500000);

/*----------XPoblar----------*/

TRUNCATE TABLE telefonosProveedores;
TRUNCATE TABLE telefonosPersona;
TRUNCATE TABLE Clientes;
TRUNCATE TABLE Empleados;
TRUNCATE TABLE Proveedores;
TRUNCATE TABLE Accesorios;
TRUNCATE TABLE Repuestos;
TRUNCATE TABLE Motos;
TRUNCATE TABLE Personas;
TRUNCATE TABLE Ventas;
TRUNCATE TABLE DetallesVentas;
TRUNCATE TABLE Productos;
TRUNCATE TABLE DetallesCompras;
TRUNCATE TABLE Compras;

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
ALTER TABLE DetallesVentas ADD CONSTRAINT CK_DetallesVentas_cantidad CHECK(cantidad > 0);

--Color Naranja
ALTER TABLE Productos ADD CONSTRAINT CK_Productos_tipoProducto CHECK(tipoProducto IN('R', 'M', 'A'));

--Color Morado
ALTER TABLE DetallesCompras ADD CONSTRAINT CK_DetallesCompras_cantidad CHECK(cantidad > 0 and REGEXP_LIKE(cantidad, '^[0-9]+$'));
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
ALTER TABLE Repuestos ADD CONSTRAINT FK_Productos_id FOREIGN KEY(idProducto) REFERENCES Productos(idProducto);
ALTER TABLE Motos ADD CONSTRAINT FK_Motos_id FOREIGN KEY(idProducto) REFERENCES Productos(idProducto);
ALTER TABLE Accesorios ADD CONSTRAINT FK_Accesorios_id FOREIGN KEY(idProducto) REFERENCES Productos(idProducto);

-- Color Morado
ALTER TABLE telefonosProveedores ADD CONSTRAINT FK_telefonosProveedores_id FOREIGN KEY(idProveedor) REFERENCES Proveedores(idProveedor);
ALTER TABLE DetallesCompras ADD CONSTRAINT FK_DetallesCompras_idCompra FOREIGN KEY(idCompra) REFERENCES Compras(idCompra);
ALTER TABLE DetallesCompras ADD CONSTRAINT FK_DetallesCompras_idProducto FOREIGN KEY(idProducto) REFERENCES Productos(idProducto);
ALTER TABLE Compras ADD CONSTRAINT FK_Compras_idProveedor FOREIGN KEY(idProveedor) REFERENCES Proveedores(idProveedor);
ALTER TABLE Compras ADD CONSTRAINT FK_Compras_idEmpleado FOREIGN KEY(idEmpleado) REFERENCES Empleados(idPersona);


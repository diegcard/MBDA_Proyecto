
/*--------------------Atributos--------------------*/
/*----------Primary Keys----------*/--
-- Maneter Personas
ALTER TABLE Personas ADD CONSTRAINT PK_Personas PRIMARY KEY(idPersona);
ALTER TABLE telefonosPersona ADD CONSTRAINT PK_telefonosPersona PRIMARY KEY(idPersona, telefono);
ALTER TABLE Clientes ADD CONSTRAINT PK_Clientes PRIMARY KEY(idPersona);
ALTER TABLE Empleados ADD CONSTRAINT PK_Empleados PRIMARY KEY(idPersona);

-- Mantener Ventas
ALTER TABLE Ventas ADD CONSTRAINT PK_Ventas PRIMARY KEY(idVenta);
ALTER TABLE DetallesVentas ADD CONSTRAINT PK_DetallesVentas PRIMARY KEY(idDetalleVenta);

-- Mantener Productos
ALTER TABLE Productos ADD CONSTRAINT PK_Productos PRIMARY KEY(idProducto);
ALTER TABLE Motos ADD CONSTRAINT PK_Motos PRIMARY KEY(idProducto);
ALTER TABLE Repuestos ADD CONSTRAINT PK_Repuestos PRIMARY KEY(idProducto);
ALTER TABLE Accesorios ADD CONSTRAINT PK_Accesorios PRIMARY KEY(idProducto);

-- Mantener Compras
ALTER TABLE Proveedores ADD CONSTRAINT PK_Proveedores PRIMARY KEY(idProveedor);
ALTER TABLE telefonosProveedores ADD CONSTRAINT PK_AtelefonosProveedores PRIMARY KEY(idProveedor, telefono);
ALTER TABLE DetallesCompras ADD CONSTRAINT PK_idDetalleCompra PRIMARY KEY(idDetalleCompra);
ALTER TABLE Compras ADD CONSTRAINT PK_Compras PRIMARY KEY(idCompra);

/*----------UNIQUE KEYS----------*/
-- Maneter Personas
ALTER TABLE Personas ADD CONSTRAINT UK_Personas_correoElectronico UNIQUE (correoElectronico);

-- Mantener Compras
ALTER TABLE Proveedores ADD CONSTRAINT UK_Proveedores_nombre UNIQUE (nombre);
ALTER TABLE Proveedores ADD CONSTRAINT UK_Proveedores_correoElectronico UNIQUE (correoElectronico);

/*----------Cheks----------*/
-- Maneter Personas
ALTER TABLE Personas ADD CONSTRAINT CK_Personas_idPersona CHECK (REGEXP_LIKE(idPersona, '^[0-9]+$'));
ALTER TABLE Personas ADD CONSTRAINT CK_Personas_tipoIdentificacion CHECK (tipoIdentificacion IN('C.C', 'T.I', 'C.E', 'P.P'));
ALTER TABLE Personas ADD CONSTRAINT CK_Personas_Correo CHECK(correoElectronico LIKE '%@%');
ALTER TABLE Empleados ADD CONSTRAINT CK_Empleados_Sex CHECK(sexo IN('H', 'M', 'O'));
ALTER TABLE Empleados ADD CONSTRAINT CK_Empleados_Ecivil CHECK(estadoCivil IN('S', 'C', 'V', 'D', 'U'));

-- Mantener Ventas
ALTER TABLE Ventas ADD CONSTRAINT CK_estadoVenta CHECK(estadoVenta IN('A', 'P', 'R'));
ALTER TABLE DetallesVentas ADD CONSTRAINT CK_DetallesVentas_cantidad CHECK(cantidad >= 0);

-- Mantener Productos
ALTER TABLE Productos ADD CONSTRAINT CK_Productos_tipoProducto CHECK(tipoProducto IN('R', 'M', 'A'));
ALTER TABLE Productos ADD CONSTRAINT CK_Productos_precio CHECK(precio >= 0);
ALTER TABLE Productos ADD CONSTRAINT CK_EstadoProducto CHECK(estadoProducto IN('D', 'N'));

-- Mantener Compras
ALTER TABLE DetallesCompras ADD CONSTRAINT CK_DetallesCompras_cantidad CHECK(cantidad >= 0 and REGEXP_LIKE(cantidad, '^[0-9]+$'));
ALTER TABLE Compras ADD CONSTRAINT CK_Compras_Ecompra CHECK(estadoCompra IN('P','A', 'R', 'E', 'C', 'F', 'T'));
ALTER TABLE Proveedores ADD CONSTRAINT CK_Proveedores_Correo CHECK(correoElectronico LIKE '%@%');

/*----------FOREIGN KEYS----------*/
-- Maneter Personas
ALTER TABLE telefonosPersona ADD CONSTRAINT FK_telefonosPersona_idPersona FOREIGN KEY(idPersona) REFERENCES Personas(idPersona);
ALTER TABLE Clientes ADD CONSTRAINT FK_Clientes FOREIGN KEY(idPersona) REFERENCES Personas(idPersona);
ALTER TABLE Empleados ADD CONSTRAINT FK_Empleados FOREIGN KEY(idPersona) REFERENCES Personas(idPersona);

-- Mantener Ventas
ALTER TABLE Ventas ADD CONSTRAINT FK_Ventas_idEmpleado FOREIGN KEY(idEmpleado) REFERENCES Empleados(idPersona);
ALTER TABLE Ventas ADD CONSTRAINT FK_Ventas_idCliente FOREIGN KEY(idCliente) REFERENCES Clientes(idPersona);
ALTER TABLE DetallesVentas ADD CONSTRAINT FK_DetallesVentas_idVenta FOREIGN KEY(idVenta) REFERENCES Ventas(idVenta);
ALTER TABLE DetallesVentas ADD CONSTRAINT FK_DetallesVentas_idProducto FOREIGN KEY(idProducto) REFERENCES Productos(idProducto);

-- Mantener Productos
ALTER TABLE Repuestos ADD CONSTRAINT FK_Repuestos_Productos_id FOREIGN KEY(idProducto) REFERENCES Productos(idProducto);
ALTER TABLE Motos ADD CONSTRAINT FK_Motos_Productos_id FOREIGN KEY(idProducto) REFERENCES Productos(idProducto);
ALTER TABLE Accesorios ADD CONSTRAINT FK_Accesorios_Productos_id FOREIGN KEY(idProducto) REFERENCES Productos(idProducto);

-- Mantener Compras
ALTER TABLE telefonosProveedores ADD CONSTRAINT FK_telefonosProveedores_id FOREIGN KEY(idProveedor) REFERENCES Proveedores(idProveedor);
ALTER TABLE DetallesCompras ADD CONSTRAINT FK_DetallesCompras_idCompra FOREIGN KEY(idCompra) REFERENCES Compras(idCompra);
ALTER TABLE DetallesCompras ADD CONSTRAINT FK_DetallesCompras_idProducto FOREIGN KEY(idProducto) REFERENCES Productos(idProducto);
ALTER TABLE Compras ADD CONSTRAINT FK_Compras_idProveedor FOREIGN KEY(idProveedor) REFERENCES Proveedores(idProveedor);
ALTER TABLE Compras ADD CONSTRAINT FK_Compras_idEmpleado FOREIGN KEY(idEmpleado) REFERENCES Empleados(idPersona);

/*--------------------Atributos--------------------*/

/*----------Primary Keys----------*/
-- Color Azul
ALTER TABLE Personas ADD CONSTRAINT PK_Personas PRIMARY KEY(idPersona);
ALTER TABLE telefonosPersona ADD CONSTRAINT PK_telefonosPersona PRIMARY KEY(idPersona, telefono);
ALTER TABLE Clientes ADD CONSTRAINT PK_Personas PRIMARY KEY(idPersona);
ALTER TABLE Empleados ADD CONSTRAINT PK_Personas PRIMARY KEY(idPersona);

-- Color Verde
ALTER TABLE Ventas ADD CONSTRAINT PK_Ventas PRIMARY KEY(idVenta);
ALTER TABLE DetallesVentas ADD CONSTRAINT PK_DetallesVentas PRIMARY KEY(idDetalleVenta);

-- Color Naranja

ALTER TABLE Productos ADD CONSTRAINT PK_Productos PRIMARY KEY(idProducto);
ALTER TABLE Motos ADD CONSTRAINT PK_Motos PRIMARY KEY(idProducto);
ALTER TABLE Repuestos ADD CONSTRAINT PK_Repuestos PRIMARY KEY(idProducto);
ALTER TABLE Accesorios ADD CONSTRAINT PK_Accesorios PRIMARY KEY(idProducto);

-- Color Morado


/*----------UNIQUE KEYS----------*/
-- Color Azul
ALTER TABLE Personas ADD CONSTRAINT UK_Personas_Id_tId UNIQUE (identificacion, tipoIdentificacion);
ALTER TABLE Personas ADD CONSTRAINT UK_Personas_correoElectronico UNIQUE (correoElectronico);

-- Color Verde
-- Color Naranja
-- Color Morado
/*----------FOREIGN KEYS----------*/
-- Color Azul
ALTER TABLE telefonosPersona ADD FK_telefonosPersona_idPersona FOREIGN KEY(idPersona) REFERENCES Personas(idPersona);
ALTER TABLE Clientes ADD FK_Clientes FOREIGN KEY(idPersona) REFERENCES Personas(idPersona);
ALTER TABLE Empleados ADD FK_Empleados FOREIGN KEY(idPersona) REFERENCES Personas(idPersona);

-- Color Verde

ALTER TABLE Repuestos ADD FK_Productos_id FOREIGN KEY(idProducto) REFERENCES Productos(idProducto);
ALTER TABLE Motos ADD FK_Motos_id FOREIGN KEY(idProducto) REFERENCES Productos(idProducto);
ALTER TABLE Accesorios ADD FK_Accesorios_id FOREIGN KEY(idProducto) REFERENCES Productos(idProducto);

-- Color Naranja
-- Color Morado

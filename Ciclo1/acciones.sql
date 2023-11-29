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
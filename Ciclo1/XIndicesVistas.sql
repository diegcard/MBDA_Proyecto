/*----------Eliminando Indices----------*/
DROP INDEX idx_idPersona;
DROP INDEX idx_idVenta;
DROP INDEX idx_idProducto;
DROP INDEX idx_idCompras;

/*----------Eliminando Vistas----------*/
DROP VIEW infoEmpleados;
DROP VIEW infoRepuestos;
DROP VIEW infoMotos;
DROP VIEW infoAccesorios;
DROP VIEW infoClientes;
DROP VIEW ProductoDebajoStock;
DROP VIEW ProductoMasVendido;
DROP VIEW ClientesConMayorCompras;
DROP VIEW EmpleadosConMayorVentas;
DROP VIEW ProductoMasComprado;
DROP VIEW ProveedorConMasCompras;
DROP VIEW VentasPorMes;
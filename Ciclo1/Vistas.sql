/*Me muestra la informacion de los empleados*/
CREATE OR REPLACE VIEW infoEmpleados AS
SELECT
    P.idPersona AS "Identificacion",
    P.nombre AS "Nombre",
    P.apellido AS "apellido",
    P.direccion AS "direccion",
    P.correoElectronico AS "Correo Electronico",
    E.sexo AS "Sexo",
    E.estadoCivil AS "Estado Civil",
    E.cargo AS "Cargo",
    E.salario AS "Salario"
FROM
    Personas P
JOIN
    Empleados E ON P.idPersona = E.idPersona;

/*Me muestra la informacion de los Repuestos*/
CREATE OR REPLACE VIEW infoRepuestos AS
SELECT 
    p.idProducto AS "Id Producto",
    p.nombre AS "Nombre Producto",
    p.precio AS "Precio",
    p.cantidadEnStock AS "Cantidad en Stock",
    p.tipoProducto AS "Tipo de Producto",
    p.estadoProducto AS "Estado del Producto",
    e.tipo AS "Tipo de Repuesto",
    e.descripcion AS "Descripcion"
FROM 
    Productos p
JOIN
    Repuestos e ON p.idProducto = e.idProducto;

/*Me muestra la informacion de las Motos*/
CREATE OR REPLACE VIEW infoMotos AS
SELECT 
    p.idProducto AS "Id Producto",
    p.nombre AS "Nombre Producto",
    p.precio AS "Precio",
    p.cantidadEnStock AS "Cantidad en Stock",
    p.tipoProducto AS "Tipo de Producto",
    p.estadoProducto AS "Estado del Producto",
    e.marca AS "Marca",
    e.modelo AS "Modelo",
    e.anio AS "Año",
    e.color AS "Color",
    e.cilindraje AS "Cilindraje",
    e.descripcion AS "Descripcion"
FROM 
    Productos p
JOIN
    Motos e ON p.idProducto = e.idProducto;

/*Me muestra la informacion de los Accesorios*/
CREATE OR REPLACE VIEW infoAccesorios AS
SELECT 
    p.idProducto AS "Id Producto",
    p.nombre AS "Nombre Producto",
    p.precio AS "Precio",
    p.cantidadEnStock AS "Cantidad en Stock",
    p.tipoProducto AS "Tipo de Producto",
    p.estadoProducto AS "Estado del Producto",
    e.descripcion AS "Descripcion"
FROM 
    Productos p
JOIN
    Accesorios e ON p.idProducto = e.idProducto;

/*Me muestra la informacion de los Clientes*/
CREATE OR REPLACE VIEW infoClientes AS 
SELECT 
    p.idPersona AS "Identificacion",
    p.nombre AS "Nombre",
    p.apellido AS "apellidos",
    p.direccion AS "direccion",
    p.correoElectronico AS "Correo Electronico",
    c.ocupacion AS "Ocupacion",
    c.ingresos AS "Ingresos"
FROM
    Personas p
JOIN
    Clientes c ON p.idPersona = c.idPersona;

/*Muestra la informacion de los productos por debajo del Stock que es 5*/
CREATE OR REPLACE VIEW ProductoDebajoStock AS
SELECT 
    p.idProducto AS "Id Producto",
    p.nombre AS "Nombre Producto",
    p.cantidadEnStock AS "Stock"
FROM
    Productos p
WHERE
    p.cantidadEnStock < 5;

/*Muestra el top 5 de los productos mas vendidos*/
CREATE OR REPLACE VIEW ProductoMasVendido AS
SELECT 
    p.nombre AS "Producto Más Vendido", 
    SUM(dv.cantidad) AS "Cantidad Vendida", 
    SUM(dv.precioTotal) AS "Total Vendido"
FROM Productos p
    INNER JOIN DetallesVentas dv ON p.idProducto = dv.idProducto
    GROUP BY p.nombre
ORDER BY SUM(dv.cantidad) DESC
FETCH FIRST 5 ROW ONLY;

/*Muestra el CLiente con mayor Compras*/ 

CREATE OR REPLACE VIEW ClientesConMayorCompras AS
SELECT 
    p.nombre AS "Nombre del Cliente", 
    COUNT(v.idVenta) AS "Número de Compras", 
    SUM(v.totalVenta) AS "Total de Compras" 
FROM Personas p
    INNER JOIN Clientes c ON p.idPersona = c.idPersona
    LEFT JOIN Ventas v ON p.idPersona = v.idCliente
    GROUP BY p.nombre
    HAVING SUM(v.totalVenta) IS NOT NULL
    ORDER BY SUM(v.totalVenta) DESC
    FETCH FIRST 5 ROW ONLY;

/*Muestra el Empleado con mayor Ventas*/
CREATE OR REPLACE VIEW EmpleadosConMayorVentas AS
SELECT 
    p.nombre AS "Nombre del Empleado", 
    COUNT(v.idVenta) AS "Número de Ventas", 
    SUM(v.totalVenta) AS "Total de Ventas"
FROM Personas p
    INNER JOIN Empleados e ON p.idPersona = e.idPersona
    LEFT JOIN Ventas v ON p.idPersona = v.idEmpleado
    GROUP BY p.nombre
    HAVING SUM(v.totalVenta) IS NOT NULL
    ORDER BY SUM(v.totalVenta) DESC
    FETCH FIRST 5 ROW ONLY;

/*Muestra el top 5 de los productos mas comprados*/
CREATE OR REPLACE VIEW ProductoMasComprado AS
SELECT 
    p.nombre AS "Producto Más Comprado", 
    SUM(dv.cantidad) AS "Cantidad Comprada", 
    SUM(dv.subtotal) AS "Total Comprado"
FROM Productos p
    INNER JOIN DetallesCompras dv ON p.idProducto = dv.idProducto
    GROUP BY p.nombre
ORDER BY SUM(dv.cantidad) DESC
FETCH FIRST 5 ROW ONLY;

/*Muestra el proveedor con mas compras*/
CREATE OR REPLACE VIEW ProveedorConMasCompras AS
SELECT 
    p.nombre AS "Nombre del Proveedor", 
    COUNT(c.idCompra) AS "Número de Compras", 
    SUM(c.totalCompra) AS "Total de Compras"
FROM proveedores p
    INNER JOIN Proveedores pr ON p.idProveedor = pr.idProveedor
    LEFT JOIN Compras c ON p.idProveedor = c.idProveedor
    GROUP BY p.nombre
    HAVING SUM(c.totalCompra) IS NOT NULL
    ORDER BY SUM(c.totalCompra) DESC
    FETCH FIRST 5 ROW ONLY;

/*Muestra la vista de un mes en Expecifico*/
CREATE OR REPLACE VIEW VentasPorMes AS
SELECT 
    EXTRACT(MONTH FROM v.fechaVenta) AS "Mes", 
    SUM(v.totalVenta) AS "Total de Ventas"
FROM Ventas v
    GROUP BY EXTRACT(MONTH FROM v.fechaVenta)
    ORDER BY EXTRACT(MONTH FROM v.fechaVenta) ASC;
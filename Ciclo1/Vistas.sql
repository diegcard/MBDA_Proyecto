/*Me muestra la informacion de los empleados*/
CREATE OR REPLACE VIEW infoEmpleados AS
SELECT
    P.identificacion,
    P.nombre,
    P.apellidos,
    P.dirrecion AS direccion,
    P.correoElectronico,
    E.sexo,
    E.etadoCivil,
    E.cargo,
    E.salario
FROM
    Personas P
JOIN
    Empleados E ON P.idPersona = E.idPersona;
/*Me muestra la informacion de los Clientes*/
CREATE OR REPLACE VIEW infoClientes AS 
SELECT 
    p.identificacion,
    p.nombre,
    p.apellidos,
    p.dirrecion AS direccion,
    p.correoElectronico,
    c.ocupacion,
    c.ingresos
FROM
    Personas p
JOIN
    Clientes c ON p.idPersona = c.idPersona;

/*Muestra la informacion de los productos por debajo del Stock que es 5*/
CREATE OR REPLACE VIEW ProductoDebajoStock AS
SELECT 
    p.idProducto,
    p.nombre,
    p.stock
FROM
    Productos p
WHERE
    p.stock < 5;

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
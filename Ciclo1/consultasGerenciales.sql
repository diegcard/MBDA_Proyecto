-- Consultar Producto mas vendido
SELECT p.nombre AS "Producto Más Vendido", SUM(dv.cantidad) AS "Cantidad Vendida"
FROM Productos p
INNER JOIN DetallesVentas dv ON p.idProducto = dv.idProducto
GROUP BY p.nombre
ORDER BY SUM(dv.cantidad) DESC
FETCH FIRST 1 ROW ONLY;
-- Consultar Clientes con más Compras:
SELECT p.nombre AS "Nombre del Cliente", COUNT(v.idVenta) AS "Número de Compras"
FROM Personas p
INNER JOIN Clientes c ON p.idPersona = c.idPersona
LEFT JOIN Ventas v ON p.idPersona = v.idCliente
GROUP BY p.nombre
ORDER BY COUNT(v.idVenta) DESC;
-- Revisar Ventas del Mes
SELECT v.idVenta, v.fechaVenta, v.horaVenta, v.totalVenta
FROM Ventas v
WHERE EXTRACT(MONTH FROM v.fechaVenta) = 11;
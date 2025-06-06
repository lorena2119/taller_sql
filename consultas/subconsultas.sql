USE tienda_db;

-- Encuentra los nombres de los clientes que han realizado al menos un pedido de más de $500.000.
SELECT u.nombre as nombreCliente
FROM usuarios as u
INNER JOIN pedidos as p ON u.usuario_id = p.cliente_id
WHERE p.pedido_id IN(
    SELECT d.pedido_id
    FROM detalles_pedidos as d
    WHERE d.precio_unitario > 500000
);

-- Muestra los productos que nunca han sido pedidos.
SELECT p.nombre as nombreProductoNoPedido
FROM productos as p
WHERE p.producto_id NOT IN(
    SELECT d.pedido_id
    FROM detalles_pedidos as d
);

-- Lista los empleados que han gestionado pedidos en los últimos 6 meses.
SELECT u.nombre as nombreEmpleado
FROM usuarios as u
INNER JOIN empleados as e ON u.usuario_id = e.usuario_id
WHERE e.empleado_id IN(
    SELECT p.empleado_id
    FROM pedidos as p
    WHERE p.fecha_pedido >= CURDATE() - INTERVAL 6 MONTH
);

-- Encuentra el pedido con el total de ventas más alto.
SELECT *, cantidad * precio_unitario as Total
FROM detalles_pedidos
WHERE cantidad * precio_unitario = (
    SELECT MAX(cantidad*precio_unitario)
    FROM detalles_pedidos
)

-- Muestra los nombres de los clientes que han realizado más pedidos que el promedio de pedidos de todos los clientes.
SELECT u.nombre as nombreCliente
FROM usuarios as u
INNER JOIN empleados as e ON u.usuario_id = e.usuario_id
WHERE e.empleado_id IN(
    SELECT p.empleado_id
    FROM pedidos as p
    WHERE p.fecha_pedido >= CURDATE() - INTERVAL 6 MONTH
);
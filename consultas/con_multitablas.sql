USE tienda_db;

--Encuentra los nombres de los clientes y los detalles de sus pedidos.
SELECT u.nombre as nombreCliente, d.pedido_id as 'ID Pedido', p.cliente_id as 'ID Cliente', p.fecha_pedido as fechaPedido, pd.nombre as nombreProducto, d.cantidad, d.precio_unitario, p.estado
FROM detalles_pedidos as d
INNER JOIN pedidos as p ON d.pedido_id = p.pedido_id
INNER JOIN productos as pd ON d.producto_id = pd.producto_id
INNER JOIN usuarios as u ON u.usuario_id = p.cliente_id;

-- Lista todos los productos pedidos junto con el precio unitario de cada pedido
SELECT pd.nombre as nombreProducto, pd.precio as precioUnitario, p.pedido_id
FROM detalles_pedidos as d
INNER JOIN pedidos as p ON d.pedido_id = p.pedido_id
INNER JOIN productos as pd ON d.producto_id = pd.producto_id;

-- Encuentra los nombres de los clientes y los nombres de los empleados que gestionaron sus pedidos
SELECT u.nombre as nombreCliente, u.tipo_id = 2 as nombreEmpleado, p.pedido_id as 'ID Pedido', p.estado
FROM pedidos as p
INNER JOIN empleados as e ON p.empleado_id = e.empleado_id
INNER JOIN usuarios as u ON u.usuario_id = p.cliente_id;

-- Muestra todos los pedidos y, si existen, los productos en cada pedido, incluyendo los pedidos sin productos usando `LEFT JOIN`
SELECT p.*, pd.nombre as nombreProducto
FROM pedidos as p
LEFT JOIN detalles_pedidos as d ON d.pedido_id = p.pedido_id
LEFT JOIN productos as pd ON d.producto_id = pd.producto_id;

-- Encuentra los productos y, si existen, los detalles de pedidos en los que no se ha incluido el producto usando `RIGHT JOIN`.
SELECT p.*, d.pedido_id, d.cantidad
FROM detalles_pedidos as d
RIGHT JOIN productos as p ON d.producto_id = p.producto_id;

-- Lista todos los empleados junto con los pedidos que han gestionado, si existen, usando `LEFT JOIN` para ver los empleados sin pedidos.
SELECT u.nombre as nombreEmpleado, e.*, d.pedido_id as idPedidoGestionado
FROM empleados as e
LEFT JOIN pedidos as d ON d.empleado_id = e.empleado_id
LEFT JOIN usuarios as u ON e.empleado_id = u.usuario_id;

--Encuentra los empleados que no han gestionado ningún pedido usando un `LEFT JOIN` combinado con `WHERE`.
SELECT u.nombre as nombreEmpleado, e.*, d.pedido_id as idPedidoGestionado
FROM empleados as e
LEFT JOIN pedidos as d ON d.empleado_id = e.empleado_id
LEFT JOIN usuarios as u ON e.empleado_id = u.usuario_id
WHERE d.pedido_id IS NOT NULL;

-- Calcula el total gastado en cada pedido, mostrando el ID del pedido y el total, usando `JOIN`.
SELECT p.pedido_id as 'ID Pedido', d.precio_unitario * d.cantidad as totalGastado
FROM pedidos as p
JOIN detalles_pedidos as d ON d.pedido_id = p.pedido_id;

-- Realiza un `CROSS JOIN` entre clientes y productos para mostrar todas las combinaciones posibles de clientes y productos.
SELECT u.usuario_id, p.nombre as nombreProducto, u.nombre as nombreCliente
FROM usuarios as u
CROSS JOIN productos AS p
WHERE u.tipo_id = 1;
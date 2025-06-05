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


-- Muestra todos los pedidos y, si existen, los productos en cada pedido, incluyendo los pedidos sin productos usando `LEFT JOIN`
SELECT p.*, pd.nombre as nombreProducto
FROM pedidos as p
LEFT JOIN detalles_pedidos as d ON d.pedido_id = p.pedido_id
LEFT JOIN productos as pd ON d.producto_id = pd.producto_id;

-- Encuentra los productos y, si existen, los detalles de pedidos en los que no se ha incluido el producto usando `RIGHT JOIN`.
SELECT p.*, d.pedido_id, d.cantidad
FROM detalles_pedidos as d
RIGHT JOIN productos as p ON d.producto_id = p.producto_id;

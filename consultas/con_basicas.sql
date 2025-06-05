USE tienda_db;

-- Consulta todos los datos de la tabla `usuarios` para ver la lista completa de clientes.
SELECT * FROM usuarios;
-- SELECT * FROM productos;
-- SELECT * FROM empleados;
-- SELECT * FROM detalles_pedidos;

-- Muestra los nombres y correos electrónicos de todos los clientes que residen en la ciudad de Madrid.
SELECT nombre as nombreUsuario, email as correoUsuario
FROM usuarios
WHERE ciudad = 'Madrid';

-- Obtén una lista de productos con un precio mayor a $100.000, mostrando solo el nombre y el precio.
SELECT nombre as nombreProducto, precio as precioProducto
FROM productos
WHERE precio > 100000;

-- Encuentra todos los empleados que tienen un salario superior a $2.500.000, mostrando su nombre, puesto y salario.
SELECT puesto as puestoEmpleado, salario as salarioEmpleado, u.nombre as nombreEmpleado
FROM empleados as e
INNER JOIN usuarios as u ON e.usuario_id = u.usuario_id
WHERE salario > 2500000;

-- Lista los nombres de los productos en la categoría "Electrónica", ordenados alfabéticamente.
SELECT nombre as nombreProducto
FROM productos
WHERE categoria = 'Electrónica'
ORDER BY nombre;

-- Muestra los detalles de los pedidos que están en estado "Pendiente", incluyendo el ID del pedido, el ID del cliente y la fecha del pedido.
SELECT d.pedido_id as 'ID Pedido', p.cliente_id as 'ID Cliente', p.fecha_pedido as fechaPedido, d.cantidad, d.precio_unitario, pd.nombre as nombreProducto, p.estado
FROM detalles_pedidos as d
INNER JOIN pedidos as p ON d.pedido_id = p.pedido_id
INNER JOIN productos as pd ON d.producto_id = pd.producto_id
WHERE p.estado = 'Pendiente';

-- Encuentra el nombre y el precio del producto más caro en la base de datos.
SELECT precio as mayorPrecio, nombre as nombreProducto
FROM productos
ORDER BY precio DESC
LIMIT 1;

-- Obtén el total de pedidos realizados por cada cliente, mostrando el ID del cliente y el total de pedidos.
SELECT COUNT(pedido_id) as totalPedidos, cliente_id, u.nombre as nombreCliente
FROM pedidos as p
INNER JOIN usuarios as u ON u.usuario_id = p.cliente_id
GROUP BY cliente_id;

--Calcula el promedio de salario de todos los empleados en la empresa.
SELECT AVG(salario) as salarioPromedio
FROM empleados;

-- Encuentra el número de productos en cada categoría, mostrando la categoría y el número de productos.
SELECT categoria, COUNT(nombre) as numeroProductos
FROM productos
GROUP BY categoria;

-- Obtén una lista de productos con un precio mayor a $75 USD, mostrando solo el nombre, el precio y su respectivo precio en USD.
SELECT nombre as nombreProducto, precio/4000 as precioUSD, precio as precioCOP
FROM productos
WHERE precio/4000 > 75;

-- Lista todos los proveedores registrados.
SELECT * 
FROM proveedores;
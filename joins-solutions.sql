--Get all customers and their addresses.
--Could also just SELECT *, wasn't sure what question was asking for
SELECT customers.first_name, customers.last_name, addresses.street, addresses.city, addresses.state, addresses.zip, addresses.address_type
FROM customers
JOIN addresses ON customers.id=addresses.customer_id;

--Get all orders and their line items.
SELECT *
FROM orders
JOIN line_items ON line_items.order_id=orders.id;

--Which warehouses have cheetos?
SELECT *
FROM warehouse
JOIN warehouse_product ON warehouse.id=warehouse_product.warehouse_id
JOIN products ON warehouse_product.product_id=products.id
WHERE products.description='cheetos';

--Which warehouses have diet pepsi?

SELECT warehouse.warehouse, products.description 
FROM warehouse
JOIN warehouse_product ON warehouse.id=warehouse_product.warehouse_id
JOIN products ON warehouse_product.product_id=products.id
WHERE products.id=6;

--Get the number of orders for each customer. NOTE: It is OK if 
--those without orders are not included in results.

SELECT customers.first_name, customers.last_name, COUNT (*) AS total_orders FROM customers
JOIN addresses ON customers.id = addresses.customer_id
JOIN orders ON orders.address_id=addresses.id
GROUP BY customers.id;

--How many customers do we have?
SELECT count(*)
FROM customers;

--How many products do we carry?
SELECT count(*)
FROM products;

--What is the total available on-hand quantity of diet pepsi?
SELECT sum(warehouse_product.on_hand) AS total_product, products.description AS product
FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
JOIN products ON warehouse_product.product_id = products.id
WHERE products.description = 'diet pepsi'
GROUP BY products.description;
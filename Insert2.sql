
-- Use the new database
USE Task2DB;
GO

-- Sample customers
INSERT INTO customers (customer_id, customer_name)
VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David'),
(5, 'Eva');

-- Sample products
INSERT INTO products (product_id, product_name, category_id)
VALUES
(101, 'Laptop', 1),
(102, 'Mouse', 1),
(103, 'Keyboard', 1),
(201, 'Shirt', 2),
(202, 'Jeans', 2);

-- Sample orders
INSERT INTO orders (order_id, customer_id, product_id, quantity, price, order_date)
VALUES
(1001, 1, 101, 1, 900.00, '2025-01-15'),
(1002, 2, 102, 2, 25.00, '2025-01-17'),
(1003, 1, 103, 1, 45.00, '2025-02-03'),
(1004, 3, 201, 3, 30.00, '2025-03-10'),
(1005, 4, 202, 2, 50.00, '2025-03-12'),
(1006, 5, 101, 1, 900.00, '2025-04-01'),
(1007, 2, 201, 1, 30.00, '2025-04-05');

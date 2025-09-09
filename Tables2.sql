
-- Use the new database
USE Task2DB;
GO

-- Optional: Create sample tables
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name NVARCHAR(100)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name NVARCHAR(100),
    category_id INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

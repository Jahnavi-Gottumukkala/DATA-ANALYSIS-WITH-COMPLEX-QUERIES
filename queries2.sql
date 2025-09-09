USE Task2DB;
GO
WITH CustomerTotal AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        SUM(o.quantity * o.price) AS total_spent
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    GROUP BY c.customer_id, c.customer_name
),
RankedCustomers AS (
    SELECT *,
           RANK() OVER (ORDER BY total_spent DESC) AS customer_rank
    FROM CustomerTotal
)
SELECT customer_id, customer_name, total_spent, customer_rank
FROM RankedCustomers
WHERE customer_rank <= 5;
GO

-- ============================
-- 2. Monthly Sales Trend with Moving Average
-- ============================
SELECT 
    DATEPART(YEAR, order_date) AS order_year,
    DATEPART(MONTH, order_date) AS order_month,
    SUM(quantity * price) AS monthly_sales,
    AVG(SUM(quantity * price)) OVER(
        ORDER BY DATEPART(YEAR, order_date), DATEPART(MONTH, order_date) 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg_3months
FROM orders
GROUP BY DATEPART(YEAR, order_date), DATEPART(MONTH, order_date)
ORDER BY order_year, order_month;
GO

-- ============================
-- 3. Top Product per Category
-- ============================
WITH ProductSales AS (
    SELECT 
        p.product_id,
        p.product_name,
        p.category_id,
        SUM(o.quantity * o.price) AS total_sales
    FROM orders o
    JOIN products p ON o.product_id = p.product_id
    GROUP BY p.product_id, p.product_name, p.category_id
),
RankedProducts AS (
    SELECT *,
           ROW_NUMBER() OVER(PARTITION BY category_id ORDER BY total_sales DESC) AS rank
    FROM ProductSales
)
SELECT category_id, product_id, product_name, total_sales
FROM RankedProducts
WHERE rank = 1;
GO

-- ============================
-- 4. Customers Who Spent Above Average
-- ============================
SELECT 
    customer_id, 
    SUM(quantity * price) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(quantity * price) > (
    SELECT AVG(total_amount) 
    FROM (
        SELECT SUM(quantity * price) AS total_amount
        FROM orders
        GROUP BY customer_id
    ) AS AvgPerCustomer
);
GO

-- ============================
-- 5. Products in Top 10% Revenue
-- ============================
WITH ProductRevenue AS (
    SELECT product_id, SUM(quantity * price) AS total_sales
    FROM orders
    GROUP BY product_id
)
SELECT product_id, total_sales
FROM ProductRevenue
WHERE total_sales >= (
    SELECT MAX(total_sales) * 0.9
    FROM ProductRevenue
);
GO

-- ============================
-- 6. Highest Quantity Order per Customer
-- ============================
WITH RankedOrders AS (
    SELECT *,
           ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY quantity DESC) AS rn
    FROM orders
)
SELECT customer_id, order_id, quantity, price
FROM RankedOrders
WHERE rn = 1;
GO

-- ============================
-- 7. Year-over-Year Sales Growth
-- ============================
WITH YearlySales AS (
    SELECT 
        DATEPART(YEAR, order_date) AS order_year,
        SUM(quantity * price) AS total_sales
    FROM orders
    GROUP BY DATEPART(YEAR, order_date)
)
SELECT 
    order_year,
    total_sales,
    LAG(total_sales) OVER(ORDER BY order_year) AS prev_year_sales,
    CAST(
        (total_sales - LAG(total_sales) OVER(ORDER BY order_year)) * 100.0 /
        LAG(total_sales) OVER(ORDER BY order_year) AS DECIMAL(10,2)
    ) AS yoy_growth_percent
FROM YearlySales;
GO

-- ============================
-- 8. Category Sales Contribution Percentage
-- ============================
SELECT 
    category_id,
    SUM(quantity * price) AS category_sales,
    SUM(quantity * price) * 100.0 / SUM(SUM(quantity * price)) OVER() AS pct_contribution
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY category_id
ORDER BY pct_contribution DESC;
GO
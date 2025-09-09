# DATA-ANALYSIS-WITH-COMPLEX-QUERIES
# Task 2: Advanced SQL Data Analysis
**Author:** Jahnavi  
**Database:** Task2DB  
**Techniques Used:** CTEs, Window Functions, Subqueries  

---

## Overview

This project performs **advanced data analysis** on a sample sales database using SQL Server. The goal is to generate insights into customer spending, product performance, and sales trends.  

The queries leverage:  

- **CTEs (Common Table Expressions):** for modular query structure  
- **Window Functions:** for ranking, cumulative totals, moving averages, and percent contributions  
- **Subqueries:** for filtering based on averages and percentiles  

---

## Queries & Insights

### 1. Top 5 Customers by Total Spend
**SQL Techniques:** CTE, RANK() Window Function  
**Purpose:** Identify the top-spending customers.  
**Insight:** Highlights high-value customers who contribute the most to revenue.  

---

### 2. Monthly Sales Trend with Moving Average
**SQL Techniques:** Aggregate functions, Window Function with `AVG() OVER()`  
**Purpose:** Analyze monthly sales trends and calculate a 3-month moving average.  
**Insight:** Reveals seasonal patterns and growth trends.  

---

### 3. Top Product per Category
**SQL Techniques:** CTE, ROW_NUMBER() Window Function, Partitioning  
**Purpose:** Find the highest-selling product in each category.  
**Insight:** Helps identify best-performing products for inventory or marketing focus.  

---

### 4. Customers Who Spent Above Average
**SQL Techniques:** Subquery, HAVING clause  
**Purpose:** Filter customers whose total spend exceeds the average.  
**Insight:** Highlights high-value customers for targeted campaigns.  

---

### 5. Products in Top 10% Revenue
**SQL Techniques:** CTE, Subquery  
**Purpose:** Identify products that generate top 10% of revenue.  
**Insight:** Helps focus on key revenue-driving products.  

---

### 6. Highest Quantity Order per Customer
**SQL Techniques:** ROW_NUMBER() Window Function  
**Purpose:** Find the largest order by quantity for each customer.  
**Insight:** Shows maximum order sizes and influential customers.  

---

### 7. Year-over-Year Sales Growth
**SQL Techniques:** CTE, LAG() Window Function  
**Purpose:** Measure yearly sales and calculate YoY growth.  
**Insight:** Reveals growth trends and identifies strong/weak years.  

---

### 8. Category Sales Contribution Percentage
**SQL Techniques:** Window Function `SUM() OVER()`  
**Purpose:** Calculate each category’s percentage contribution to total sales.  
**Insight:** Highlights which categories contribute most to overall revenue.  

---

## How to Run

1. Open **SQL Server Management Studio (SSMS)**.  
2. Connect to your server and select the `Task2_DataAnalysis` database.  
3. Open `queries.sql` and execute.  
4. Observe the output for each query and note trends or patterns.  

---

## Conclusion

This analysis provides a **data-driven understanding** of:  

- Customer behavior and high-value customers  
- Product and category performance  
- Monthly and yearly sales trends  

The results can guide business decisions such as promotions, inventory management, and strategic planning.


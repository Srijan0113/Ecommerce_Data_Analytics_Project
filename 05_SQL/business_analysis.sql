-- Q1: Sample data from the sales data
select * from sales_data limit 10;

-- Q2: Count the total no. of records
select count(*) as total_records from sales_data;

-- Q3: Check the structure of the sales table

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'sales_data'
ORDER BY ordinal_position;

-- Q4: Find the earliest and latest order dates

SELECT
    MIN(order_date) AS earliest_order_date,
    MAX(order_date) AS latest_order_date
FROM sales_data;

-- Q5: Count the number of unique customers

SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM sales_data;

-- Q6: Count the number of unique products

SELECT COUNT(DISTINCT product_id) AS total_products
FROM sales_data;

-- Q7: Identify the product categories

SELECT DISTINCT category
FROM sales_data
ORDER BY category;

-- Q8: Identify the sales regions

SELECT DISTINCT region
FROM sales_data
ORDER BY region;

-- Q9: What is the total sales generated?

SELECT
    SUM(sales) AS total_sales
FROM sales_data;


-- Q10: What is the total profit generated?

SELECT
    SUM(profit) AS total_profit
FROM sales_data;


-- Q11: What is the average sales value per transaction?

SELECT
    AVG(sales) AS average_sales
FROM sales_data;


-- Q12: What is the highest single transaction sales value?

SELECT
    MAX(sales) AS highest_sales
FROM sales_data;


-- Q13: What is the lowest single transaction sales value?

SELECT
    MIN(sales) AS lowest_sales
FROM sales_data;


-- Q14: What are the total sales and profit by category?

SELECT
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY category
ORDER BY total_sales DESC;


-- Q15: What are the total sales and profit by region?

SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY region
ORDER BY total_sales DESC;


-- Q16: Which are the top 10 products by total sales?

SELECT
    product_name,
    SUM(sales) AS total_sales
FROM sales_data
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;


-- Q17: Which are the top 10 products by total profit?

SELECT
    product_name,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;


-- Q18: Which are the bottom 10 products by total profit?

SELECT
    product_name,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY product_name
ORDER BY total_profit ASC
LIMIT 10;


-- Q19: Which are the top 10 customers by total sales?

SELECT
    customer_id,
    customer_name,
    SUM(sales) AS total_sales
FROM sales_data
GROUP BY customer_id, customer_name
ORDER BY total_sales DESC
LIMIT 10;


-- Q20: Which customers generated the highest total profit?

SELECT
    customer_id,
    customer_name,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY customer_id, customer_name
ORDER BY total_profit DESC
LIMIT 10;


-- Q21: How many orders were placed in each region?

SELECT
    region,
    COUNT(DISTINCT order_id) AS total_orders
FROM sales_data
GROUP BY region
ORDER BY total_orders DESC;


-- Q22: How many customers are there in each segment?

SELECT
    segment,
    COUNT(DISTINCT customer_id) AS total_customers
FROM sales_data
GROUP BY segment
ORDER BY total_customers DESC;


-- Q23: What is the total quantity sold by category?

SELECT
    category,
    SUM(quantity) AS total_quantity
FROM sales_data
GROUP BY category
ORDER BY total_quantity DESC;


-- Q24: What is the total sales and profit by sub-category?

SELECT
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY sub_category
ORDER BY total_sales DESC;


-- Q25: Which products generated a loss?

SELECT
    product_name,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;


-- Q26: What is the total sales and profit for each discount level?

SELECT
    discount,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY discount
ORDER BY discount;


-- Q27: Which regions have total profit greater than 10,000?

SELECT
    region,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY region
HAVING SUM(profit) > 10000
ORDER BY total_profit DESC;


-- Q28: What are the yearly sales and profit?

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY year;


-- Q29: What are the monthly sales and profit?

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY year, month;


-- Q30: What is the overall profit margin?

SELECT
    SUM(profit) / NULLIF(SUM(sales), 0) AS profit_margin
FROM sales_data;

-- Q31: What are the transactions with sales greater than 1,000?

SELECT
    order_id,
    product_name,
    sales,
    profit
FROM sales_data
WHERE sales > 1000
ORDER BY sales DESC
LIMIT 10;


-- Q32: Top 10 customers by total sales with profit margin 
SELECT
    customer_id,
    customer_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(profit) / NULLIF(SUM(sales), 0) AS profit_margin
FROM sales_data
GROUP BY customer_id, customer_name
ORDER BY total_sales DESC
LIMIT 10;
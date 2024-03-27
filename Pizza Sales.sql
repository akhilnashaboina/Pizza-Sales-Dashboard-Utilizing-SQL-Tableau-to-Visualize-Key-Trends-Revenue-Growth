-- KPI’S

-- Total Revenue:
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

-- Average Order Value:
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value FROM pizza_sales;

-- Total Pizzas Sold:
SELECT SUM(quantity) AS Total_Pizzas_Sold FROM pizza_sales;

-- Total Orders:
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;
 
-- Average Pizzas per Order:
SELECT CAST(SUM(quantity) / COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS Avg_Pizzas_Per_Order FROM pizza_sales;

 

-- Hourly Trend for Total Pizzas Sold
SELECT HOUR(order_time) AS order_hours, SUM(quantity) AS Total_pizzas_sold
FROM pizza_sales
GROUP BY order_hours
ORDER BY order_hours;


-- Weekly Trend for Orders
SELECT WEEK(STR_TO_DATE(order_date, '%d-%m-%Y'), 3) AS Week_number, 
       YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')) AS Order_year,
       COUNT(DISTINCT order_id) AS Total_orders 
FROM pizza_sales
GROUP BY WEEK(STR_TO_DATE(order_date, '%d-%m-%Y'), 3), 
YEAR(STR_TO_DATE(order_date, '%d-%m-%Y'))
ORDER BY Week_number, Order_year;


-- % of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_sales, 
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales)  AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category
ORDER BY PCT DESC;


-- % of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_sales, 
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY PCT DESC;


-- Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) AS Total_quantity_sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_quantity_sold DESC;


-- Top 5 Best Sellers by Revenue
SELECT pizza_name, CAST(SUM(total_price)  AS DECIMAL(10,2)) AS Total_Sales FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Sales DESC LIMIT 5;


-- Bottom 5 Best Sellers by Revenue
SELECT pizza_name, CAST(SUM(total_price)  AS DECIMAL(10,2)) AS Total_Sales FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Sales LIMIT 5;


-- Top 5 Best Sellers by Total Quantity
SELECT pizza_name, CAST(SUM(quantity)  AS DECIMAL(10,2)) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC LIMIT 5;


-- Bottom 5 Best Sellers by Total Quantity
SELECT pizza_name, CAST(SUM(quantity)  AS DECIMAL(10,2)) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity LIMIT 5;


-- Top 5 Best Sellers by Total Orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC LIMIT 5;


-- Bottom 5 Best Sellers by Total Orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders LIMIT 5;








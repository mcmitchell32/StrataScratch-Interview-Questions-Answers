--Given a table of purchases by date, calculate the month-over-month percentage change in revenue. 
--The output should include the year-month date (YYYY-MM) and percentage change, rounded to the 2nd decimal point, and sorted from the beginning of the year to the end of the year.
--The percentage change column will be populated from the 2nd month forward and can be calculated as ((this month's revenue - last month's revenue) / last month's revenue)*100.

WITH cte AS ( 
SELECT TO_CHAR(created_at::DATE, 'YYYY-MM') AS year_month, 
       SUM(value) AS total_revenue, 
       LAG(SUM(value), 1) OVER (ORDER BY TO_CHAR(created_at::DATE, 'YYYY-MM') ASC) AS previous_revenue
  FROM sf_transactions 
GROUP BY year_month) 

SELECT year_month, 
       ROUND(((total_revenue - previous_revenue) / previous_revenue) * 100, 2) AS pct_change
  FROM cte 
  

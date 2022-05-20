
--Find whether the number of drivers that have churned increased or decreased in each year compared to the previous one. 
--Output the year (specifically, you can use the year the driver left Lyft) along with the corresponding number of churns in that year, 
--the number of churns in the previous year, and an indication on whether the number has been increased (output the value 'increase') or 
--decreased (output the value 'decrease'). Order records by the year in ascending order.le number.

WITH cte AS (
SELECT index, 
       EXTRACT(year FROM end_date) AS year
    FROM lyft_drivers
WHERE end_date IS NOT NULL), 

cte2 AS (
SELECT year, 
       COUNT(*) AS current_churn, 
       LAG(COUNT(*), 1, '0') OVER (ORDER BY year ASC) AS previous_churn
    FROM cte 
GROUP BY year
ORDER BY year ASC) 

SELECT *, 
       CASE WHEN current_churn > previous_churn THEN 'increase' 
            WHEN current_churn < previous_churn THEN 'decrease' 
            ELSE 'no change' 
            END AS churn_trends
    FROM cte2

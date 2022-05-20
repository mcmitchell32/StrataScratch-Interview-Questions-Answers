--Calculate the running total (i.e., cumulative sum) energy consumption of the Facebook data centers in all 3 continents by the date. 
--Output the date, running total energy consumption, and running total percentage rounded to the nearest whole number.

WITH combined_energy AS ( 
SELECT *
  FROM fb_eu_energy UNION ALL 
SELECT * 
  FROM fb_na_energy UNION ALL 
SELECT * FROM fb_asia_energy), 

running_total AS (
SELECT date, 
       SUM(consumption) AS running_total
  FROM combined_energy
GROUP BY date 
ORDER BY date ASC) 

SELECT date, 
       SUM(running_total) OVER (ORDER BY date ASC) AS running_total, 
       ROUND(SUM(running_total) OVER (ORDER BY date ASC) / SUM(running_total) OVER() * 100) AS pct_total_consumption
  FROM running_total
  

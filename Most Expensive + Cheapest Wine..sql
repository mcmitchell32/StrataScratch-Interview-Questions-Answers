--Find the cheapest and the most expensive variety in each region. Output the region along with the corresponding most expensive and the cheapest variety.

WITH merged AS (
SELECT region_1 AS region, 
       variety, 
       price
    FROM winemag_p1 UNION ALL 
SELECT region_2 AS region, 
       variety, 
       price
    FROM winemag_p1), 

rankings AS (
SELECT region, 
       variety, 
       price, 
       ROW_NUMBER() OVER (PARTITION BY region 
                            ORDER BY price ASC) AS cheap_rank, 
       ROW_NUMBER() OVER (PARTITION BY region 
                            ORDER BY price DESC) AS expensive_rank 
    FROM merged
WHERE region IS NOT NULL
    AND price IS NOT NULL) 

SELECT region, 
       MAX(CASE WHEN cheap_rank = 1 THEN variety END) AS cheapest_wine_variety, 
       MAX(CASE WHEN expensive_rank = 1 THEN variety END) AS most_expensive_variety 
    FROM rankings
WHERE cheap_rank = 1 
    OR expensive_rank = 1  
GROUP BY region 
ORDER BY region ASC

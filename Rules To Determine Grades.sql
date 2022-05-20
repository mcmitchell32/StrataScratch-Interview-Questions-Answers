--Find the rules used to determine each grade. Show the rule in a separate column in the format of 'Score > X AND Score <= Y => Grade = A' where X and Y are 
--the lower and upper bounds for a grade. Output the corresponding grade and its highest and lowest scores along with the rule. 
--Order the result based on the grade in ascending order.


SELECT grade, 
       MIN(score), 
       MAX(score), 
       'Score > ' || MIN(score) - 1 || ' AND Score < = ' || MAX(score) || ' => Grade = ' || grade  AS rule
    FROM los_angeles_restaurant_health_inspections
GROUP BY grade
ORDER BY grade ASC

WITH unnest AS(
SELECT city, 
       UNNEST(STRING_TO_ARRAY(amenities, ',')) AS amenities
    FROM airbnb_search_details), 
    
rankings AS (
SELECT city, 
       COUNT(amenities) AS total_amenities,
       ROW_NUMBER() OVER (ORDER BY COUNT(amenities) DESC) AS amenity_ranking
    FROM unnest
GROUP BY city) 

SELECT city
    FROM rankings 
WHERE amenity_ranking = 1   


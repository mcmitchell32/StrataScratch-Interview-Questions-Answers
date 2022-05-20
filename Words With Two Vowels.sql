--Find all words which contain exactly two vowels in any list in the table.

WITH cte AS (
SELECT UNNEST(STRING_TO_ARRAY(words1, ',')) AS words
    FROM google_word_lists
UNION SELECT UNNEST(STRING_TO_ARRAY(words2, ',')) AS words
    FROM google_word_lists) 
    
SELECT words
    FROM cte 
WHERE NOT words ~ '([aeiou].*){3}'
  AND words ~ '([aeiou].*){2}'
  

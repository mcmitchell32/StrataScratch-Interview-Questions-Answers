--Facebook's web logs capture every action from users starting from page loading to page scrolling. 
--Find the user with the least amount of time between a page load and their first scroll down. 
--Your output should include the user id, page load time, first scroll down time, and time between the two events in seconds.

WITH page_load AS ( 
SELECT user_id, 
       timestamp AS load_time, 
       action 
    FROM facebook_web_log 
WHERE action = 'page_load'), 

scroll_down AS (
SELECT user_id, 
       timestamp AS scroll_time, 
       action
    FROM facebook_web_log 
WHERE action = 'scroll_down'), 

duration AS (
SELECT pl.user_id, 
       pl.load_time, 
       sd.scroll_time, 
       (sd.scroll_time - pl.load_time)::TIME AS time_between_events 
    FROM page_load AS pl 
INNER JOIN scroll_down AS sd 
    ON pl.user_id = sd.user_id 
    AND scroll_time > load_time) 

SELECT user_id, 
       load_time, 
       scroll_time, 
       time_between_events 
    FROM duration 
WHERE time_between_events = (SELECT MIN(time_between_events) 
        FROM duration)
        

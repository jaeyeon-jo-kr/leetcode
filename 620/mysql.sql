# Write your MySQL query statement below
SELECT id, movie, description, rating
FROM Cinema
WHERE 1=1 
AND description NOT LIKE 'boring'
AND id % 2 = 1
ORDER BY rating DESC

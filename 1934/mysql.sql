# Write your MySQL query statement below
SELECT s.user_id, ROUND(IFNULL(c.cnt, 0.0), 2) confirmation_rate
FROM Signups s
LEFT JOIN 
(SELECT user_id, SUM(c.action LIKE 'confirmed') / (COUNT(*) + 0.0) cnt 
FROM Confirmations c
GROUP BY user_id) c ON s.user_id = c.user_id

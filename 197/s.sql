# Write your MySQL query statement below
SELECT T.id Id
FROM Weather T
INNER JOIN Weather Y ON DATE_SUB(T.recordDate, INTERVAL 1 DAY) = Y.recordDate
WHERE Y.temperature < T.temperature

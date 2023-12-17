# Write your MySQL query statement below
SELECT S.machine_id, 
ROUND(AVG(E.timestamp - S.timestamp), 3) processing_time
FROM Activity S
LEFT JOIN Activity E 
ON S.machine_id = E.machine_id 
AND S.process_id = E.process_id
AND E.activity_type = "end"
WHERE S.activity_type = "start"
GROUP BY machine_id

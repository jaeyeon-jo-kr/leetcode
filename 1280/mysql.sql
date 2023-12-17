# Write your MySQL query statement below
SELECT stu.student_id, stu.student_name, sub.subject_name, COUNT(exa.student_id) as attended_exams
FROM Students stu
CROSS JOIN Subjects sub 
LEFT JOIN Examinations exa 
ON stu.student_id = exa.student_id AND sub.subject_name = exa.subject_name
GROUP BY stu.student_id, sub.subject_name
ORDER BY student_id, subject_name

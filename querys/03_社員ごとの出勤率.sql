-- Q3: 社員ごとの出勤率を少数1位まで表示
SELECT
 e.name AS '社員名',
 ROUND(
  COUNT(CASE WHEN a.status='出勤' THEN 1 END) *100.0 /COUNT(a.id) 
 ) AS '出勤率'
 
FROM employees e
 JOIN attendance a ON e.id = a.employee_id

GROUP BY e.id;
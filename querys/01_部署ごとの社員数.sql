-- Q1: 部署ごとの社員数を集計
SELECT
  d.name AS '部署',
  COUNT(e.id) AS '社員数'
FROM 
  departments d
JOIN employees e ON d.id = e.department_id
GROUP BY d.name;

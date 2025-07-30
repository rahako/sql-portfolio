-- Q2: 部署ごとの平均給与を求め、小数第1位まで表示
SELECT
  d.name AS '部署',
  ROUND(AVG(e.salary), 1) AS '平均給与'
FROM departments d
JOIN employees e ON d.id = e.department_id
GROUP BY d.name;

-- Q4: 社員ごとの直近30日以内の欠勤日一覧
SELECT
  e.name,
  a.date AS '欠勤日'
FROM attendance a
JOIN employees e ON a.employee_id = e.id
WHERE 
  a.status = '欠勤'
  AND a.date >= DATE('now', '-30 days')
  AND a.date <= DATE('now');

-- Q5: 自分の部署の平均給与以上の社員を抽出（相関サブクエリ）
SELECT
  e.name,
  e.salary
FROM employees e
WHERE e.salary >= (
  SELECT AVG(e2.salary)
  FROM employees e2
  WHERE e2.department_id = e.department_id
);

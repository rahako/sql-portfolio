-- ============================
-- 社員管理データベースポートフォリオ
-- ============================

-- ▼ 部署テーブル作成
CREATE TABLE departments (
  id INTEGER PRIMARY KEY,
  name TEXT
);

-- ▼ 社員テーブル作成
CREATE TABLE employees (
  id INTEGER PRIMARY KEY,
  name TEXT,
  department_id INTEGER,
  join_date DATE,
  salary INTEGER,
  FOREIGN KEY (department_id) REFERENCES departments(id)
);

-- ▼ 勤怠テーブル作成
CREATE TABLE attendance (
  id INTEGER PRIMARY KEY,
  employee_id INTEGER,
  date DATE,
  status TEXT,
  FOREIGN KEY (employee_id) REFERENCES employees(id)
);
-- ▼ データ挿入（部署）
INSERT INTO departments VALUES
(1, '営業'),
(2, '開発'),
(3, '人事');

-- ▼ データ挿入（社員）
INSERT INTO employees VALUES
(1, '田中', 1, '2022-01-10', 300000),
(2, '佐藤', 2, '2021-04-01', 400000),
(3, '鈴木', 3, '2020-10-20', 280000);

-- ▼ データ挿入（勤怠）
INSERT INTO attendance VALUES
(1, 1, '2024-07-01', '出勤'),
(2, 1, '2024-07-02', '有休'),
(3, 2, '2024-07-01', '出勤'),
(4, 3, '2024-07-01', '欠勤');

-- ============================
-- ▼ クエリ例（分析・表示用）
-- ============================

-- 1. 部署ごとの社員数
SELECT d.name AS 部署名, COUNT(e.id) AS 社員数
FROM departments d
LEFT JOIN employees e ON d.id = e.department_id
GROUP BY d.name;

-- 2. 出勤率を社員ごとに表示
SELECT
  e.name AS 氏名,
  ROUND(
    SUM(CASE WHEN a.status = '出勤' THEN 1 ELSE 0 END) * 1.0 / COUNT(a.id),
    2
  ) AS 出勤率
FROM employees e
JOIN attendance a ON e.id = a.employee_id
GROUP BY e.name;

-- 3. 給与が30万円以上の社員一覧
SELECT name, salary
FROM employees
WHERE salary >= 300000
ORDER BY salary DESC;

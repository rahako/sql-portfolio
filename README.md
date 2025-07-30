# SQLポートフォリオ

このリポジトリは、求人応募および学習記録のために作成したSQLポートフォリオです。  
SQLiteを使用して、基本的な集計・JOIN・サブクエリを活用した5問のSQLクエリを収録しています。

---

## 📂 ディレクトリ構成
<img width="707" height="360" alt="Q1解説方法-07-30-2025_10_54_AM" src="https://github.com/user-attachments/assets/837d8f04-9c72-4022-b8c1-1aa71d74986e" />

---

## 📌 クエリ一覧と出力結果

### Q1: 部署ごとの社員数

- 使用技術：JOIN + GROUP BY + COUNT  
- `queries/01_部署ごとの社員数.sql`  
▶️ [結果を見る](images/q1_result.png)
<img width="867" height="589" alt="q1_result" src="https://github.com/user-attachments/assets/f410da8c-f66a-4e5d-9b13-921c523d9418" />


---

### Q2: 部署ごとの平均給与

- 使用技術：JOIN + AVG + ROUND  
- `queries/02_部署ごとの平均給与.sql`  
▶️ [結果を見る](images/q2_result.csv)

---

### Q3: 社員ごとの出勤率（%）

- 使用技術：JOIN + CASE + 割合計算 + ROUND  
- `queries/03_社員ごとの出勤率.sql`  
▶️ [結果を見る](images/q3_result.csv)

---

### Q4: 直近30日以内に欠勤した社員一覧

- 使用技術：JOIN + WHERE + 日付関数 + DISTINCT  
- `queries/04_欠勤社員一覧.sql`  
▶️ [結果を見る](images/q4_result.csv)

---

### Q5: 部署の平均給与以上の社員

- 使用技術：相関サブクエリ + AVG  
- `queries/05_部署平均以上の給与.sql`  
▶️ [結果を見る](images/q5_result.csv)

---

## 🔄 データベースの再生成方法

このリポジトリには、実行済みの `portfolio.db` に加えて、  
データを初期状態から再構築できる SQL スクリプトも含まれています。

### 使用ファイル

- `database/insert_sample_data.sql` … データ挿入用（INSERT文）  
- `database/portfolio.db` … 実行済みのSQLiteファイル

### 再構築手順（任意）

1. SQLite対応ツールを使用（例：[DB Browser for SQLite](https://sqlitebrowser.org/)）  
2. 新規データベースを作成（例：空の `portfolio.db` を用意）  
3. `CREATE TABLE` 定義と `insert_sample_data.sql` の中身を順に実行  

※ 今回はChatGPTが仮のテーブル定義を使用して再構築しています。

---

## 💬 補足・工夫した点

- SQLiteの `DATE('now', '-30 days')` を使用して、日付フィルタを動的に実装  
- 出勤率では `CASE WHEN` 式で条件集計を実行  
- 相関サブクエリを活用

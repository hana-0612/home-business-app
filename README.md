#テーブル設計

## users テーブル

| Column             | Type    | Options             |
| ------------------ | ------- | ------------------- |
| employee_number    | integer | null: false, unicue |
| last_name          | string  | null: false         |
| first_name         | string  | null: false         |
| email              | string  | null: false, unicue |
| encrypted_password | string  | null: false         |
| department         | text    | null: false         |
| position           | text    | null: false         |

## reports テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| start_of_work    | datetime   | null: false                    |
| breakstart       | datetime   |                                |
| breakend         | datetime   |                                |
| end_of_work      | datetime   |                                |
| business_content | text       |                                |
| user             | references | null: false, foreign_key: true |
| comment          | references | foreign_key: true              |
| manegement       | references | foreign_key: true              |

## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| text       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| report     | references | null: false, foreign_key: true |
| manegement | references | null: false                    |

## manegements テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| report     | references | foreign_key: true              |
| comment    | references | foreign_key: true              |
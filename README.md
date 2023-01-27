# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birth_date         | date    | null: false               |
| self_introduction  | text    | null: false               |

### Association   

- has_many :resumes
- has_many :comments

## resumes テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| resume_text | text       | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :answer

## answers テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| answer_text | text       | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :resume

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| comment_text | string     | null: false                    |
| resume       | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :resume
- belongs_to :user

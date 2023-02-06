

# アプリケーション名

---

### TuReTa

# アプリケーション概要

---

釣れた情報を公開し、秘密の情報を売り買いできる。

# URL

---

[https://originalapp38804.onrender.com](https://originalapp38804.onrender.com/)

# テスト用アカウント

---

Basic認証ID：admin

Basic認証パスワード：3333

- テスト１ユーザー

メールアドレス：test1@gmail.com

パスワード：test1test1

- テスト２ユーザー

メールアドレス：test2@gmail.com

パスワード：test2test2

# 利用方法

---

- 釣果投稿
1. トップページ（一覧ページ）のヘッダーからユーザー新規登録を行う。
    
    もしくは、上記テスト用アカウントでログインする。
    
2. 画面下部の「投稿する」ボタンから、投稿内容（画像、タイトル、釣果の要約、位置情報、釣果の本文、価格）を入力し出品ボタンを押して出品する。

---

- 釣果購入
1. 一覧ページから釣果をクリックして、釣果の要約を確認する。
2. 購入したい釣果があれば、「購入画面に進む」ボタンを押し購入画面へ進む。
3. 電話番号、カード番号、有効期限、セキュリティーコードを入力して「購入」ボタンを押す。
4. 購入が成功すると、地図と本文を含めた全文を閲覧できる。

テスト用購入情報

電話番号：09011111111

カード番号：4242424242424242

有効期限：0333

セキュリティーコード：123

# アプリケーションを作成した背景

---

時間をかけずに副収入を得られることを目標に作りました。物販では出品以外にも手間がかかるため、情報を売りたいと考えました。自分の特技を教えることで収入を得たいとも考えました。オンラインスクールなどでは柔軟に時間の変更ができず限られた時間で行える副業ではないように感じました。一度出品しそのまま放っておけば、買いたい人が買っていくようなサービスを、物ではなく情報で実現したいと考えました。また、普遍的な情報では価値が生まれないと考え、情報の鮮度が重要な釣りをテーマにしました。

# 洗い出した要件

---

[要件定義書](https://docs.google.com/spreadsheets/d/1yAn9VKYENHXJNurLVLx9Ge2hSRS8CcoflT_preaEhYY/edit#gid=464786232)

# 実装した機能についての画像やGIFおよびその説明

---
Google Map表示
[![Image from Gyazo](https://i.gyazo.com/f930faf5988d3d0160818fef532c82f3.png)](https://gyazo.com/f930faf5988d3d0160818fef532c82f3)
テックキャンプでは習っていないgoogle map APIを使い出品、編集、購入後画面へ地図を表示させました。

ユーザー新規登録
[![Image from Gyazo](https://i.gyazo.com/8900befb9a42438335fe116953ca5648.gif)](https://gyazo.com/8900befb9a42438335fe116953ca5648)

釣果新規投稿
[![Image from Gyazo](https://i.gyazo.com/c9b44c928d8661f0d18f8dcb073f6495.gif)](https://gyazo.com/c9b44c928d8661f0d18f8dcb073f6495)

釣果購入
[![Image from Gyazo](https://i.gyazo.com/8fd7b4a73c4d4f411862cd5424ad5b57.gif)](https://gyazo.com/8fd7b4a73c4d4f411862cd5424ad5b57)

# 実装予定の機能

---

- コメント機能
- ユーザー情報編集機能
- ジャンル、カテゴリー分け機能
- マイページ
- ０円商品の購入ページスキップ機能
- 購入履歴、購入商品の繰り返し表示機能
- 検索機能
- テストコード

# データベース設計
---
[![Image from Gyazo](https://i.gyazo.com/f35d3bbdf865d62deda6a40469e2da17.png)](https://gyazo.com/f35d3bbdf865d62deda6a40469e2da17)

# 画面遷移図

---
[![Image from Gyazo](https://i.gyazo.com/292eb33d35674b45b29002ed226f29ec.png)](https://gyazo.com/292eb33d35674b45b29002ed226f29ec)

# 開発環境

---

- フロントエンド
- バックエンド
- Ruby/Ruby on Rails/JavaScript/MySQL/Github/AWS/EC2/Visual Studio Code
- gem: devise/mini_magick/image_processing/payjp/dotenv-rails/gmaps4rails/geocoder/aws-sdk-s3
- Githubリポジトリ：[https://github.com/kiyotech/originalapp38804](https://github.com/kiyotech/originalapp38804)


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
| self_introduction  | text    |                           |

### Association   

- has_many :resumes
- has_many :comments
- has_many :orders

## resumes テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| resume_text   | text       | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| answer        | text       | null: false                    |
| point_address | string     |                                |
| latitude      | float      |                                |
| longitude     | float      |                                |

### Association

- belongs_to :user
- has_many   :comments
- has_many   :orders

## orders テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| phone_number | string     | null: false                    |
| resume       | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :resume
- belongs_to :user

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| comment_text | string     | null: false                    |
| resume       | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :resume
- belongs_to :user

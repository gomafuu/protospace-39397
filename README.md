# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル

| Column     | Type       | Options              |
| ---------- | ---------- | -------------------- |
| email      | string     | null: false, unique  |
| encrypted  | string     | null: false          |
| name       | string     | null: false          |
| profile    | text       | null: false          |
| occupation | text       | null: false          |
| position   | text       | null: false          |

- has_many :prototypes
- has_many :comments

## commentsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| prototype | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

- belongs_to :users
- belongs_to :prototypes

## prototypesテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| catch_copy | text       | null: false                    |
| concept    | string     | null: false                    |
| user       | references | null: false, foreign_key: true |

- belongs_to :users
- has_many :comments
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

# DB設計

# テーブル設計

## users テーブル
| Column             | Type    | Options                  |
| -----------------  | ------- | -------------------------|
| nickname	         | string	 | null: false unique: true |
| email              | string  | null: false              |
| encrypted_password | string  | null: false              |
| genre_id           | integer | null: false              |
| profile            | text    | null: false              |
### Association
- has_many: cooks
- has_many: comments
- has_many: likes

  belongs_to: genre

with_options presence: true do
  validates :nickname
  validates :profile
end

with_options presence: true,numericality: { other_than: 1 } do  
  validates :genre_id
end  


## cooks テーブル
| Column        | Type       | Options                        |
| -----------   | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| catch_copy    | text       | null: false                    |
| category_id   | integer    | null: false                    |
| time_id       | integer    | null: false                    |
| material      | text       | null: false                    |
| making        | text       | null: false                    |
| point         | text       |                                |
| user          | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- has_many: comments
- has_many: likes

  belongs_to :category_id
  belongs_to :time_id

with_options presence: true do
  validates :title
  validates :catch_copy
  validates :material
  validates :making
end  

with_options presence: true,numericality: { other_than: 1 } do  
  validates :category_id
  validates :time_id
end  

##  likes テーブル
| Column        | Type       | Options                         |
| -----------   | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| cooks         | references | null: false, foreign_key: true |
### Association
- belongs_to: user
- belongs_to: cook

##  comments テーブル
| Column        | Type       | Options                        |
| -----------   | ---------- | ------------------------------ |
| text          | text       | null: false                    |
| user          | references | null: false, foreign_key: true |
| cook          | references | null: false, foreign_key: true |
### Association
- belongs_to: user
- belongs_to: cook

 validates :text, presence: true


 class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'レディース' },
    { id: 3, name: 'メンズ' },
    { id: 4, name: 'ベビー・キッズ' },
    { id: 5, name: 'インテリア・住まい・小物' },
    { id: 6, name: '本・音楽・ゲーム' },
    { id: 7, name: 'おもちゃ・ホビー・グッズ' },
    { id: 8, name: '家電・スマホ・カメラ' },
    { id: 9, name: 'スポーツ・レジャー' },
    { id: 10, name: 'ハンドメイド' },
    { id: 11, name: 'その他' }
  ]
 
   include ActiveHash::Associations
   has_many :items
 
  end
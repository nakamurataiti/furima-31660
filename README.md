# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| first_name         | string | null: false |
| first_name_kana    | string | null: false |
| last_name          | string | null: false |
| last_name_kana     | string | null: false |
| introduction       | text   | null: false |
| birth_day          | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| price         | string  | null: false                    |
| size          | string  | null: false                    |
| cost          | string  | null: false                    |
| days          | string  | null: false                    |
| status        | string  | null: false                    |
| prefecture_id | string  | null: false, foreign_key: true |
| text          | text    | null: false                    |
| category_id   | integer | null: false, foreign_key: true |
| shipping_id   | integer | null: false, foreign_key: true |
| user_id       | integer | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order

##  orders テーブル

| Column  | Typ     | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column          | Type    | Options                        |
| --------------  | ------- | ------------------------------ |
| post_code       | string  | null: false                    |
| phone_number    | string  | null: false                    |
| city            | string  | null: false                    |
| building_name   | string  |                     |
| building_number | string  | null: false                    |
| order_id        | integer | null: false, foreign_key: true |

### Association

- belongs_to :orders

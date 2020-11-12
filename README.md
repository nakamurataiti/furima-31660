# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| first_name         | string | null: false |
| first_name_kana    | string | null: false |
| last_name          | string | null: false |
| last_name_kana     | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| birth_day          | date   | null: false |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| price         | string     | null: false                    |
| cost_id       | integer    | null: false                    |
| days_id       | integer    | null: false                    |
| status_id     | integer    | null: false                    |
| prefecture_id | integer    | null: false,                   |
| category_id   | integer    | null: false,                   |
| text          | text       | null: false                    |
| user          | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order

##  orders テーブル

| Column | Typ        | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column          | Type       | Options                        |
| --------------  | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| phone_number    | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| building_name   | string     |                                |
| building_number | string     | null: false                    |
| order           | references | null: false, foreign_key: true |

### Association

- belongs_to :order

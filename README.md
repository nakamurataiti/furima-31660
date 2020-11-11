# テーブル設計

## users テーブル

| Column          | Type   | Options                 |
| --------------- | ------ | ----------------------  |
| nickname        | string | null: false             |
| first_name      | string | null: false             |
| first_name_kana | string | null: false             |
| last_name       | string | null: false             |
| last_name_kana  | string | null: false             |
| email           | string | null: false             |
| password        | string | null: false unique: true|


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| title  | string     | null: false                    |
| text   | text       | null: false                    |
| price  | integer    | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :orders

##  orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column          | Type       | Options                        |
| --------------  | ---------- | ------------------------------ |
| post-code       | integer    | null: false                    |
| city            | string     | null: false                    |
| building_name   | string     |                                |
| building_number | string     |                                |
| orders          | references | null: false, foreign_key: true |

### Association

- belongs_to :orders

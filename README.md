# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| title  | string     | null: false                    |
| image  | string     | null: false                    |
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
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column          | Type       | Options                        |
| --------------  | ---------- | ------------------------------ |
| post_code       | integer    | null: false                    |
| city            | string     | null: false                    |
| building_name   | string     | null: false                    |
| building_number | string     |                                |
| orders          | references | null: false, foreign_key: true |

### Association

- belongs_to :orders

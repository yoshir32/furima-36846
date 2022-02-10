# README

## usersテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| nickname             | string     | null: false                    |
| email                | string     | null: false, unique: true      |
| encrypted_password   | string     | null: false                    |
| first_name           | string     | null: false                     |
| first_name_kana      | string     | null: false                     |
| last_name            | string     | null: false                     |
| last_name_kana       | string     | null: false                     |
| birthday             | date       | null: false                     |

### Association

- has_many :items
- has_many :comments
- has_many :orders


## itemsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references  | null: false, foreign_key: true |
| item_name            | string     | null: false                    |
| item_description     | text       | null: false                    |
| category_id          | integer    | null: false                    |
| status_id            | integer    | null: false                    |
| delivery_charge_id   | integer    | null: false                    |
| prefecture_id        | integer    | null: false                    |
| necessary_time_id    | integer    | null: false                    |
| price                | integer    | null: false                    |

### Association

- belongs_to :user
- has_many :comments
- has_one :order

## commentsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| text                 | text       | null:false                     |
| item                 | references  | null: false, foreign_key: true |
| user                 | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## ordersテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| item                 | references  | null: false, foreign_key: true |
| user                 | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## shipping_addressesテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| order                | references | null: false, foreign_key: true |
| post_code            | string     | null: false                    |
| prefecture_id        | integer    | null: false                    |
| municipality         | string     | null: false                    |  
| street_number        | string     | null:false                     |
| building             | string     |                                |
| telephone            | string     | null: false                    |

### Association

- belongs_to :order

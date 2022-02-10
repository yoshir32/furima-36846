# README

## usersテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| nickname             | string     | null: false                    |
| email                | string     | null: false, unique: true      |
| password             | string     | null: false                    |
| password_confirmation| string     | null: false                    |

### Association

- has_one :profile
- has_many :items
- has_many :comments
- has_many :orders

## profilesテーブル

| user_id              | reference  | null: false, foreign_key: true  |
| first_name           | string     | null: false                     |
| first_name_kana      | string     | null: false                     |
| last_name            | string     | null: false                     |
| last_name_kana       | string     | null: false                     |
| birthday             | date       | null: false                     |

### Association

- belongs_to :user


## itemsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user_id              | reference  | null: false, foreign_key: true |
| image                | blob       | null: false                    |
| item_name            | string     | null: false                    |
| item_description     | text       | null: false                    |
| category             | string     | null: false                    |
| status               | string     | null: false                    |
| delivery_charge      | integer    | null: false                    |
| ship_from            | string     | null: false                    |
| necessary_time       | integer    | null: false                    |
| price                | integer    | null: false                    |

### Association

- belongs_to :user
- has_many :comments
- has_one :order

## commentsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| text                 | text       | null:false                     |
| item_id              | reference  | null: false, foreign_key: true |
| user_id              | reference  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## ordersテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| item_id              | reference  | null: false, foreign_key: true |
| user_id              | reference  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## shipping_addressテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| post_code            | integer    | null: false                    |
| prefecture           | string     | null: false                    |
| municipality         | string     | null: false                    |  
| street_number        | string     | null:false                     |
| building             | string     |                                |
| telephone            | integer    | null: false                    |

### Association

- belongs_to :order

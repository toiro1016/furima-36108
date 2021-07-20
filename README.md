# README
## users テーブル

| Column              | Type   | Options                  |
| ------------------- | ------ | ------------------------ |
| nickname            | string | null: false              |
| email               | string | null: false, unique:true |
| encrypted_password  | string | null: false              |
| first_name          | string | null: false              |
| last_name           | string | null: false              |
| birthday            | date   | null: false              |
| kana_first_name     | string | null: false              |
| kana_last_name      | string | null: false              |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false,                   |
| description         | text       | null: false,                   |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| shipping_fee_id     | integer    | null: false                    |
| shipping_address_id | integer    | null: false                    |
| delivery_day_id     | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belong_to :user
- has_one   :buy

## buys テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping

## shippings テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code_id | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| municipality   | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| buy            | references | null: false, foreign_key: true |

### Association

- belongs_to :buy

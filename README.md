# README
## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| first_name          | string | null: false |
| last_name           | string | null: false |
| birthday            | radio  | null: false |
| kana_first_name     | string | null: false |
| kana_last_name      | string | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| image            | text       | null: false                    |
| name             | string     | null: false,                   |
| description      | text       | null: false,                   |
| category         | radio      | null: false                    |
| status           | radio      | null: false                    |
| shipping_fee     | radio      | null: false                    |
| shipping_address | radio      | null: false                    |
| delivery_days    | radio      | null: false                    |
| price            | integer    | null: false                    |
| seller           | string     | null: false                    |
| user             | references | null: false, foreign_key: true |
| buy              | references | null: false, foreign_key: true |

### Association

- belong_to :users
- has_one   :buys

## buys テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| buyer      | string     | null: false                    |
| user       | references | null: false, foreign_key: true |
| shipping   | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one    :shippings

## shippings テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefectures   | radio      | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | integer    | null: false                    |
| buy           | references | null: false, foreign_key: true |

### Association

- belongs_to :buys

## users テーブル

| Column          | Type     | Options     |
| --------------- | -------- | ----------- |
| nickname        | string   | null: false |
| email           | string   | null: false |
| password        | string   | null: false |
| last name       | string   | null: false |
| first name      | string   | null: false |
| last name kana  | string   | null: false |
| first name kana | string   | null: false |
| birth date      | datetime | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------  | ------------------------------ |
| image                 |            |                                |
| name                  | text       | null: false                    |
| info                  | text       | null: false                    |
| category_id           | integer    | null: false                    |
| sales status_id       | integer    | null: false                    |
| shipping fee_id       | integer    | null: false                    |
| prefecture_id         | integer    | null: false                    |
| scheduled delivery_id | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :ship

## ships テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| postal code      | string     | null: false |
| prefecture_id    | integer    | null: false |
| city             | string     | null: false |
| shipping address | string     | null: false |
| phone number     | integer    | null: false |

### Association

- belongs_to :order
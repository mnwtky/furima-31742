# テーブル設計

## users テーブル

| Column             | Type   | Options                       |
| ------------------ | ------ | ----------------------------- |
| email              | string | null: false, unique: true     |
| encrypted_password | string | null: false, unique: true     |
| nickname           | string | null: false                   |
| last_name          | string | null: false                   |
| first_name         | string | null: false                   |
| last_name_kana     | string | null: false                   |
| first_name_kana    | string | null: false                   |
| birthday           | date   | null: false                   |

### Association

- has_many :items
- has_many :orders

## items テーブル
 
| Column           | Type         | Options                     |
| ---------------- | --------- | ------------------------------ |
| name             | string    | null: false                    |
| description      | text      | null: false                    |
| category_id      | integer   | null: false                    |
| condition_id     | integer   | null: false                    |
| postage_payer_id | integer   | null: false                    |
| prefecture_id    | integer   | null: false                    |
| handling_id      | integer   | null: false                    |
| price            | integer   | null: false                    |
| user             | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column         | Type       | Options                        |
| -------------  | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| city           | string     | null: false                    |
| addresses      | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false, unique: true      |
| order          | references | null: false, foreign_key: true |

### Association

- belongs_to :order

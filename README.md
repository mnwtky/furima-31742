# テーブル設計

## users テーブル

| Column          | Type   | Options                       |
| --------------- | ------ | ----------------------------- |
| email           | string | null: false, uniqueness: true |
| password        | string | null: false, uniqueness: true |
| nickname        | string | null: false                   |
| last_name       | text   | null: false                   |
| first_name      | text   | null: false                   |
| last_name_kana  | text   | null: false                   |
| first_name_kana | text   | null: false                   |
| birthday        | text   | null: false                   |

### Association

- has_many :items
- has_many :purchases

## items テーブル
 
| Column           | Type         | Options                     |
| ---------------- | --------- | ------------------------------ |
| name             | string    | null: false                    |
| description      | text      | null: false                    |
| images_id        | integer   | null: false                    |
| category_id      | integer   | null: false                    |
| condition_id     | integer   | null: false                    |
| postage_payer_id | integer   | null: false                    |
| prefecture_id    | integer   | null: false                    |
| handling_id      | integer   | null: false                    |
| price            | integer   | null: false                    |
| user             | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :images
- has_one :purchase
- belongs_to :category
- belongs_to :condition
- belongs_to :handling_time
- belongs_to :postage_payer
- belongs_to :prefecture

## purchases テーブル

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
| post_code      | string     | null: false                    |
| city           | string     | null: false                    |
| building_name  | string     |                                |
| prefectures_id | integer    | null: false, foreign_key: true |
| phone_number   | string     | null: false, uniqueness: true  |
| purchase       | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
- belongs_to :prefecture

## images テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| image  | string     | null: false                    |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item

## category テーブル

| Column   | Type   | Options     |
| -------- | ------ | ------------|
| category | string | null: false |

### Association

- has_many :items

## condition テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| condition | string     | null: false |

### Association

- has_many :items

## handling_time テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| condition | string     | null: false |

### Association

- has_many :items

## postage_payer テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| postage_payer | string | null: false |

### Association

- has_many :items

## prefecture テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| prefecture | string  | null: false |

### Association

- has_many :items
- has_many :addresses
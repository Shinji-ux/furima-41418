## usersテーブル
| Column           | Type    | Options                   |
|------------------|---------|---------------------------|
| nickname         | string  | null: false               |
| email            | string  | null: false, unique: true |
| password         | string  | null: false               |
| last_name_kanji  | string  | null: false               |
| first_name_kanji | string  | null: false               |
| last_name_kana   | string  | null: false               |
| first_name_kana  | string  | null: false               |
| birth_year       | integer | null: false               |
| birth_month      | integer | null: false               |
| birth_day        | integer | null: false               |

### associations
has_many :items

## itemsテーブル
| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| item_name     | string     | null: false                    |
| explain       | text       | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| shipping_fee  | string     | null: false                    |
| shipping_area | string     | null: false                    |
| shipping_days | string     | null: false                    |
| value         | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| sold_out      | boolean    | null: false                    |

### associations
belongs_to :users

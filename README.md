## usersテーブル
| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name_kanji    | string | null: false               |
| first_name_kanji   | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### associations
has_many :items
has_many :purchase_records


## itemsテーブル
| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| item_name        | string     | null: false                    |
| explain          | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| shipping_fee_id  | integer    | null: false                    |
| shipping_area_id | integer    | null: false                    |
| shipping_days_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### associations
belongs_to :user
has_one :purchase_record
belongs_to :item_info


## purchase_recordsテーブル
| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### associations
has_one :shipping_address
belongs_to :user
belongs_to :item


## shipping_addressテーブル
| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| postal_code      | integer    | null: false                    |
| prefecture       | string     | null: false                    |
| municipality     | string     | null: false                    |
| street_address   | string     | null: false                    |
| building         | string     |                                |
| telephone_number | integer    | null: false                    |
| purchase_record  | references | null: false, foreign_key: true |

### associations
belongs_to :purchase_record

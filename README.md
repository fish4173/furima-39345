# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false,              |
| email              | string              | null: false,unique: true  |
| encrypted_password | string              | null: false               |
| first_name         | string              | null: false               |
| last_name          | string              | null: false               |
| first_name_kana    | string              | null: false               |
| last_name_kana     | string              | null: false               |
| birthday           | date                | null: false               |


### Association

* has_many :items

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| item_name                           | string     | null: false                    |
| item_description                    | text       | null: false                    |
| category                            | integer    | null: false                    |
| condition                           | integer    | null: false                    |
| shipping_fee                        | integer    | null: false                    |
| sender_area                         | integer    | null: false                    |
| shipping_duration                   | integer    | null: false                    |
| price                               | integer    | null: false                    |
| user                                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_fee
- belongs_to_active_hash :sender_area
- belongs_to_active_hash :shipping_duration
- has_one :shipping_address
- has_one :purchases



## shipping_addresses table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| postal_code                         | string     | null: false                    |
| prefecture                          | integer    | null: false                    |
| city                                | string     | null: false                    |
| address_line1                       | string     | null: false                    |
| address_line2                       | string     |                                |
| phone_number                        | string     | null: false                    |
| item                                | string     | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to_active_hash :prefecture



## purchases table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| user                                | string     | null: false, foreign_key: true |
| item                                | string     | null: false, foreign_key: true |

### Association

- belongs_to :item



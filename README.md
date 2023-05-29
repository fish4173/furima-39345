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
| birth_year         | integer             | null: false               |
| birth_month        | integer             | null: false               |
| birth_day          | integer             | null: false               |


### Association

* has_many :items

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| item_name                           | string     | null: false                    |
| item_description                    | text       | null: false                    |
| category                            | string     | null: false                    |
| condition                           | string     | null: false                    |
| shipping_fee                        | string     | null: false                    |
| sender_area                         | string     | null: false                    |
| shipping_duration                   | string     | null: false                    |
| price                               | string     | null: false                    |
| user                                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :shipping_address

## comments table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| content     | text       | null: false                    |
| prototype   | references | null: false, foreign_key: true |


### Association

- belongs_to :item



## shipping_address table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| postal_code                         | string     | null: false                    |
| prefecture                          | text       | null: false                    |
| city                                | string     | null: false                    |
| address_line1                       | string     | null: false                    |
| address_line2                       | string     |                                |
| phone_number                        | string     | null: false                    |
| item                                | string     | null: false, foreign_key: true |

### Association

- belongs_to :item


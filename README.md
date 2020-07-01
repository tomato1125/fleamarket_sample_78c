# FLEAMARKET DB設計
# usersテーブル
|Coumn|Type|Options|
|-----|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_one :profile
- has_many :send_informations
- has_many :items
- has_one :credit

# profileテーブル
|Coumn|Type|Options|
|-----|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|datea|null: false|
|birth_month|datea|null: false|
|birth_day|datea|null: false|
|user_id|reference|foreign_key: true|
### Association
- belongs_to :user

# send_informationテーブル
|Coumn|Type|Options|
|-----|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|post_code|integer|null: false|
|prefecture_id|reference|foreign_key: true|
|city|string|null: false|
|house_number|string|null: false|
|apartment|string||
|phone-number|integer|unique: true|
|user_id|reference|foreign_key: true|
### Association
- belongs_to :user
- belongs_to_active_hash :prefecture_id


# itemテーブル
|Coumn|Type|Options|
|-----|----|-------|
|name|string|null: false|
|produce|text|null: false|
|price|integer|null: false|
|delivery_fee|integer|null: false|
|brand_id|reference||
|category_id|reference|foreign_key: true|
|condition_id|reference|foreign_key: true|
|prefecture_id|reference|foreign_key: true|
|date_id|reference|foreign_key: true|
|user_id|reference|foreign_key: true|
### Association
- belongs_to :user
- has_many :images
- belongs_to_active_hash :brand_id
- belongs_to_active_hash :category_id
- belongs_to_active_hash :condition_id
- belongs_to_active_hash :prefecture_id
- belongs_to_active_hash :date_id

# imageテーブル
|Coumn|Type|Options|
|-----|----|-------|
|image|text|null: false|
|item_id|reference|foreign_key: true|
### Association
- belongs_to :item


# creditテーブル
|Coumn|Type|Options|
|-----|----|-------|
|number|integer|null: false, unique: true|
|year|integer|null: false|
|month|integer|null: false|
|security_code|integer|null: false|
|user_id|reference|foreign_key: true|
### Association
- belongs_to :user

# categories(active_hash)
|Coumn|Type|Options|
|-----|----|-------|
|number|string|null: false|
### Association
- has_many :items

# brands(active_hash)
|Coumn|Type|Options|
|-----|----|-------|
|number|string||
### Association
- has_many :items

# conditions(active_hash)
|Coumn|Type|Options|
|-----|----|-------|
|number|string|null: false|
### Association
- has_many :items

# prefectures(active_hash)
|Coumn|Type|Options|
|-----|----|-------|
|number|string|null: false|
### Association
- has_many :send_informations
- has_many :items

# dates(active_hash)
|Coumn|Type|Options|
|-----|----|-------|
|number|string|null: false|
### Association
- has_many :items
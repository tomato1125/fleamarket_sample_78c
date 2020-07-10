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
|birth_day|date|null: false|
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
|post_code|string|null: false|
|prefecture_id|reference|null: false|
|city|string|null: false|
|house_number|string|null: false|
|apartment|string||
|phone-number|string|unique: true|
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
|deliveryfee_id|reference|null: false|
|brand_id|reference||
|category_id|reference|null: false|
|condition_id|reference|null: false|
|prefecture_id|reference|null: false|
|deliverydate_id|reference|null: true|
|selleruser_id|reference|foreign_key: true|
|buyeruser_id|reference||
### Association
- belongs_to :selleruser, class_name:"User"
- belongs_to :buyeruser, class_name:"User"

- has_many :images
- belongs_to_active_hash :brand_id
- belongs_to :itemcategory
- belongs_to_active_hash :condition_id
- belongs_to_active_hash :prefecture_id
- belongs_to_active_hash :deliverydate_id
- belongs_to_active_hash :deliveryfee_id

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
|user_id|reference|foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user

# itemcategoriesテーブル
|Coumn|Type|Options|
|-----|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
- has_many :items
- has_ancestry

# brands(active_hash)
|Coumn|Type|Options|
|-----|----|-------|
|name|string||
### Association
- has_many :items

# conditions(active_hash)
|Coumn|Type|Options|
|-----|----|-------|
|name|string|null: false|
### Association
- has_many :items

# prefectures(active_hash)
|Coumn|Type|Options|
|-----|----|-------|
|name|string|null: false|
### Association
- has_many :send_informations
- has_many :items

# deliverydates(active_hash)
|Coumn|Type|Options|
|-----|----|-------|
|name|string|null: false|
### Association
- has_many :items

# deliveryfees(active_hash)
|Coumn|Type|Options|
|-----|----|-------|
|name|string|null: false|
### Association
- has_many :items

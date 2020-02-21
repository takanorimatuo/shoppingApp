# shoppingApp DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_kana|string|null: false|
|last_kana|string|null: false|
|birth_day|date|null: false|
### Association
- has_many :Products
- has_many :cards
- has_many :banks
- has_many :user_banks
- has_many :addresses

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|address_number|string|null: false|
|city|string|null: false|
|address|string|null: false|
|tel|string|
|prefecture_id|integer|null: false, foregin_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :prefecture

## prefectures(active_hash)
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :addresses
- has_many :products

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|card_number|integer|null: false, foreign_key: true|f
|code|string|null: false|
|date|string|null: false|
### Association
- belongs_to :user

## banksテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|name|string|null: false|
|branch|string|null: false|
|number|integer|null: false|
### Association
- belongs_to :user

## users_banksテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|bank_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## Productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|size|string|null: false|
|brand|string|null: false|
|status|string|null: false|
|price|integer|null: false|
|date|string|null: false|
|text|string|null: false|
|image|text|
|score|integer|null: false|
|send|integer|null: false|
|burden|string|null: false|
|saler_id|integer|null: false, foregin_key: true|
|buyer_id|integer|foregin_key: true|
|category_id|integer|null: false, foregin_key: true|
|brand_id|integer|foregin_key: true|
|prefecture_id|integer|null: false, foregin_key: true|
### Association
- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"
- belongs_to :categories
- belongs_to :prefecture
- belongs_to :brand, optional: true
- has_many :images

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: index: true|
### Association
- has many :products

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|src|string|null: false|
|product_id|integer|null: false, foregin_key: true|
### Association
- belongs_to :product





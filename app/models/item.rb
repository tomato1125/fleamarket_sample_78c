class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, presence: true
  validates :produce, presence: true
  validates :itemcategory_id, presence: true
  validates :condition_id, presence: true
  validates :deliveryfee_id, presence: true
  validates :prefecture_id, presence: true
  validates :deliverydate_id, presence: true
  validates :price, presence: true
  validates :seller_id, presence: true

  belongs_to :seller, class_name: "User", foreign_key: "seller_id"
  belongs_to :buyer, class_name: "User", optional: true,foreign_key: "buyer_id"
  belongs_to :auction, class_name: "User", optional: true,foreign_key: "auction_id"
  has_many :images, dependent: :destroy
  belongs_to_active_hash :brand
  belongs_to :itemcategory
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :deliverydate
  belongs_to_active_hash :deliveryfee

  accepts_nested_attributes_for :images, allow_destroy: true

end

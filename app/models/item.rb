class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :selleruser, class_name: "User"
  #belongs_to :buyeruser, class_name: "User"
  has_many :images
  belongs_to_active_hash :brand
  belongs_to :itemcategory
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :deliverydate
  belongs_to_active_hash :deliveryfee

end

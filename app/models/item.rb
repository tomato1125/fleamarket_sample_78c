class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  has_many :images
  belongs_to_active_hash :brand
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :date

end

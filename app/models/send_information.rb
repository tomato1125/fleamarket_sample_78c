class SendInformation < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :post_code, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :house_number, presence: true
  belongs_to :user
  belongs_to_active_hash :prefecture
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX}
  validates :password, presence: true, confirmation: true, length: { minimum: 7 }


  has_one :profile
  has_many :send_informations
  has_many :items
  has_many :saling_items, -> { where("seller_id is not NULL && buyer_id is NULL") }, class_name: "Item"
  has_many :sold_items, -> { where("seller_id is not NULL && buyer_id is not NULL && auction_id is NULL") }, class_name: "Item"
  has_many :auction_items, -> { where("seller_id is not NULL && auction_id is not NULL && buyer_id is NULL") }, class_name: "Item"
  has_one :credit
  has_many :comments, dependent: :destroy
end

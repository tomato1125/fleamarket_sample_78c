class Profile < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user

  VALID_NAME = /\A[ぁ-んァ-ン一-龥]/
  VALID_NAME_KANA = /\A[ァ-ヶー－]+\z/

  validates :family_name, presence: true, format:{with: VALID_NAME,message:"全角で入力してください"}
  validates :first_name, presence: true, format:{with: VALID_NAME,message:"全角で入力してください"}
  validates :family_name_kana, presence: true, format:{with: VALID_NAME_KANA, message:"全角カタカナで入力してください"}
  validates :first_name_kana, presence: true, format:{with: VALID_NAME_KANA, message:"全角カタカナで入力してください"}
  validates :birth_date, presence: true
end



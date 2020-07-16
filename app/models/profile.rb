class Profile < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  
  validates :family_name, presence: true, format:{with: /[一-龥ぁ-ん]/,massage:"全角ひらがなで入力してください"}
  validates :first_name, presence: true, format:{with: /[一-龥ぁ-ん]/,massage:"全角ひらがなで入力してください"}
  validates :family_name_kana, presence: true, format:{with:/([ァ-ン]|ー)+/, message:"全角カタカナで入力してください"}
  validates :first_name_kana, presence: true, format:{with:/([ァ-ン]|ー)+/, message:"全角カタカナで入力してください"}
  validates :birth_date, presence: true
end



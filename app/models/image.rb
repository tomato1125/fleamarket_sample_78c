class Image < ApplicationRecord
  validates :images, presence: true
  belongs_to :item

  mount_uploader :image, ImageUploader
end

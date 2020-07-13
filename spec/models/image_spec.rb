require 'rails_helper'
describe Image do
  describe '#create' do
    it "is invalid without a image" do
      image = build(:image, image: "")
      image.valid?
      expect(image.errors[:image]).to include("を入力してください")
    end

    it "is invalid without a item_id" do
      image = build(:image, item_id: "")
      image.valid?
      expect(image.errors[:item_id]).to include("を入力してください")
    end
  end
end
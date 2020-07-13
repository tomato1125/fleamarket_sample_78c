require 'rails_helper'
describe Item, type: :model do
  describe '#create' do
    it "is invalid without a name" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a produce" do
      item = build(:item, produce: "")
      item.valid?
      expect(item.errors[:produce]).to include("を入力してください")
    end

    it "is invalid without a category_id" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    it "is invalid without a condition_id" do
      item = build(:item, condition_id: "")
      item.valid?
      expect(item.errors[:condition_id]).to include("を入力してください")
    end

    it "is invalid without a deliveryfee_id" do
      item = build(:item, deliveryfee_id: "")
      item.valid?
      expect(item.errors[:deliveryfee_id]).to include("を入力してください")
    end

    it "is invalid without a prefecture_id" do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    it "is invalid without a deliverydate_id" do
      item = build(:item, deliverydate_id: "")
      item.valid?
      expect(item.errors[:deliverydate_id]).to include("を入力してください")
    end

    it "is invalid without a price" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "is invalid without a user_id" do
      item = build(:item, user_id: "")
      item.valid?
      expect(item.errors[:user_id]).to include("を入力してください")
    end

    it "is invalid without a seller_id" do
      item = build(:item, seller_id: "")
      item.valid?
      expect(item.errors[:seller_id]).to include("を入力してください")
    end

    it "is invalid without a buyer_id" do
      item = build(:item, buyer_id: "")
      item.valid?
      expect(item.errors[:buyer_id]).to include("を入力してください")
    end

    it "is invalid without a auction_id" do
      item = build(:item, auction_id: "")
      item.valid?
      expect(item.errors[:auction_id]).to include("を入力してください")
    end
  end
end
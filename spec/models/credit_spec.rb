require 'rails_helper'

describe Credit do
  describe '#create' do

    it "is valid with a user, user_id, customer_id, card_id" do
      user = create(:user)
      credit = build(:credit, user_id: user.id)
      expect(credit).to be_valid
    end

    it "is invalid without a user and user_id " do
      credit = build(:credit)
      credit.valid?
      expect(credit.errors[:user]).to include("を入力してください")
    end

    it "is invalid without a customer_id " do
      user = create(:user)
      credit = build(:credit, user_id: user.id, customer_id: "")
      credit.valid?
      expect(credit.errors[:customer_id]).to include("を入力してください")
    end

    it "is invalid without a card_id " do
      user = create(:user)
      credit = build(:credit, user_id: user.id, card_id: "")
      credit.valid?
      expect(credit.errors[:card_id]).to include("を入力してください")
    end


  end
end

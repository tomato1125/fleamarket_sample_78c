require 'rails_helper'
describe SendInformation do
  describe '#create' do

    it "is invalid without a family_name" do
      send_information = build(:send_information, family_name: "")
      send_information.valid?
      expect(send_information.errors[:family_name]).to include("can't be blank")
    end

    it "is invalid without a first_name" do
      send_information = build(:send_information, first_name: "")
      send_information.valid?
      expect(send_information.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid without a family_name_kana" do
      send_information = build(:send_information, family_name_kana: "")
      send_information.valid?
      expect(send_information.errors[:family_name_kana]).to include("can't be blank")
    end

    it "is invalid without a first_name_kana" do
      send_information = build(:send_information, first_name_kana: "")
      send_information.valid?
      expect(send_information.errors[:first_name_kana]).to include("can't be blank")
    end

    it "is invalid without post_code" do
      send_information = build(:send_information, post_code: "")
      send_information.valid?
      expect(send_information.errors[:post_code]).to include("can't be blank")
    end

    it "is invalid without prefecture_id" do
      send_information = build(:send_information, prefecture_id: "")
      send_information.valid?
      expect(send_information.errors[:prefecture_id]).to include("can't be blank")
    end

    it "is invalid without city" do
      send_information = build(:send_information, city: "")
      send_information.valid?
      expect(send_information.errors[:city]).to include("can't be blank")
    end

    it "is invalid without house_number" do
      send_information = build(:send_information, house_number: "")
      send_information.valid?
      expect(send_information.errors[:house_number]).to include("can't be blank")
    end

    it "is valid with family_name, first_name, family_name_kana, first_name_kana, post_code, prefecture_id, city, house_number, apartment, phone_number, user_id" do
      send_information = build(:send_information)
      expect(send_information).to be_valid
    end

  end
end
require 'rails_helper'
describe SendInformation do
  describe '#create' do
    it "is invalid without a family_name" do
      send_information = SendInformation.new(family_name: "",first_name: "taro",family_name_kana: "yamada",first_name_kana: "taro", post_code: "000-0000", prefecture_id: "1", city: "city", house_number: "house", apartment: "apart", phone_number: "00000000000", user_id: "1")
      send_information.valid?
      expect(send_information.errors[:family_name]).to include("can't be blank")
    end
  end
end
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
  end
end
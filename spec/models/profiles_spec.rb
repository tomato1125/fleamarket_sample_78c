require 'rails_helper'
describe Profile do
  describe '#create' do

    it "is valid with a family_name, first_name, family_name_kana, first_name_kana, birth_date" do
      user = create(:user)
      profile = build(:profile,user_id: user.id)
      profile.valid?
      expect(profile).to be_valid
    end

    it "is invalid without a family_name" do
      profile = build(:profile, family_name: nil)
      profile.valid?
      expect(profile.errors[:family_name]).to include("を入力してください")
    end

    it "is invalid with a half-size family_name" do
      profile = build(:profile, family_name:"yamada")
      profile.valid?
      expect(profile.errors[:family_name]).to include("全角で入力してください")
    end

    it "is invalid without a first_name" do
      profile = build(:profile, first_name: nil)
      profile.valid?
      expect(profile.errors[:first_name]).to include("を入力してください")
    end

    it "is invalid with a half-size first_name" do
      profile = build(:profile, first_name:"tarou")
      profile.valid?
      expect(profile.errors[:first_name]).to include("全角で入力してください")
    end

    it"is invalid without a family_name_kana" do
      profile = build(:profile, family_name_kana: nil)
      profile.valid?
      expect(profile.errors[:family_name_kana]).to include("を入力してください")
    end

    it "is invalid without full-size katakana family_name_kana" do
      profile = build(:profile, family_name_kana:"山田")
      profile.valid?
      expect(profile.errors[:family_name_kana]).to include("全角カタカナで入力してください")
    end

    it "is invalid without first_name_kana" do
      profile = build(:profile, first_name_kana: nil)
      profile.valid?
      expect(profile.errors[:first_name_kana]).to include("を入力してください")
    end

    it "is invalid without full-size katakana first_name_kana" do
      profile = build(:profile, first_name_kana:"太郎")
      profile.valid?
      expect(profile.errors[:first_name_kana]).to include("全角カタカナで入力してください")
    end

    it "is invalid without a birth_date" do
      profile = build(:profile, birth_date: nil)
      profile.valid?
      expect(profile.errors[:birth_date]).to include("を入力してください")
    end

  end
end

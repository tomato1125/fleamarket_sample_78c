require 'rails_helper'
describe Profile do
  describe '#create' do
    
    it "is ivalid with a family_name, first_name, family_name_kana, first_name_kana, birth_date" do
      user = create(:user)
      profile = build(:profile,user_id: user.id)
      profile.valid?
      expect(profile).to be_valid
    end

    it "is invalid without a family_name" do
      profile = build(:profile, family_name: nil)
      profile.valid?
      expect(profile.errors[:family_name]).to include("は不正な値です")
    end

    it "is invalid without a wrong hiragana" do
      profile = build(:profile, family_name:"ヤマダ")
      profile.valid?
      expect(profile.errors[:family_name]).to include("は不正な値です")
    end

    it "is invalid without a first_name" do
      profile = build(:profile, first_name: nil)
      profile.valid?
      expect(profile.errors[:first_name]).to include("を入力してください")
    end

    it "is invalid without a wrong hiragana" do
      profile = build(:profile, first_name:"タロウ")
      profile.valid?
      expect(profile.errors[:first_name]).to include("は不正な値です")
    end

    it"is invalid without a family_name_kana" do
      profile = build(:profile, family_name_kana: nil)
      profile.valid?
      expect(profile.errors[:family_name_kana]).to include("を入力してください")
    end

    it "is invalid without a wrong katakana" do
      profile = build(:profile, family_name_kana:"山田")
      profile.valid?
      expect(profile.errors[:family_name_kana]).to include("全角カタカナで入力してください")
    end

    it "is invalid without a first_name_kana" do
      profile = build(:profile, family_name_kana: nil)
      profile.valid?
      expect(profile.errors[:family_name_kana]).to include("を入力してください")
    end

    it "is invalid without a wrong katakana" do
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
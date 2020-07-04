require 'rails_helper'
describe User do
  describe '#create' do
    # 全てを満たしていれば登録ができる
    it "is valid with a nickname, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end
    # ニックネームなしでは登録できない
    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
    # メールアドレスなしでは登録できない
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    # メールアドレスがドメインの形をとっていないと登録できない
    it "is invalid with a wrong email type(not use domain)" do
      user = build(:user, email: "kkk@gmail")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end
    # パスワードなしでは登録できない
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    # パスワード確認欄の入力なしでは登録できない
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end
    # パスワード確認欄の入力値がパスワードと違う値であれば登録できない
    it "is invalid with a wrong password_confirmation" do
      user = build(:user, password_confirmation: "00000001")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end
    # 既に登録されているメールアドレスでは登録できない
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end
    # 7文字以上のパスワードであれば登録が可能
    it "is valid with a password that has more than 7 characters " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      expect(user).to be_valid
    end
    # 6文字以下のパスワードでは登録できない
    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end
  end
end

require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do

  describe "login-check" do
    login_user
    it "should have a current_user" do
      expect(subject.current_user).to_not eq(nil)
    end
  end

  # ログインエラーメッセージのテストは統合テストで実装する物
  # describe 'sign-in out check' do
  #   before do
  #     @request.env['devise.mapping'] = Devise.mappings[:user]
  #     @user = FactoryBot.create(:user, password: "00000000", email: "kkk@egmail.com")
  #   end
  #   it 'ログイン後処理がうまくいかないこと' do
  #     post :create, user: { password: "password", email: "kkk@gmail.com" }
  #     user.valid?
  #     expect(user.errors[:email]).to include("が違います")
  #   end
  # end

end

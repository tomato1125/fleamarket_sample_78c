require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do

  describe "login-check" do
    login_user
    it "should have a current_user" do
      expect(subject.current_user).to_not eq(nil)
    end
  end

end

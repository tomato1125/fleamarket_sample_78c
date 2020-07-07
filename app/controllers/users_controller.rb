class UsersController < ApplicationController

  before_action :move_to_top, only: [:show]

  def edit
  end

  def update
  end

  def index
  end

  def destroy
  end

  def show
    @user = User.find(current_user.id)
  end

  def move_to_top
    # サインインをしていない、またはurlのidがログインユーザーのidと異なる場合リダイレクト
    if user_signed_in? == false || current_user.id != params[:id].to_i
    redirect_to root_path
    end
  end
end

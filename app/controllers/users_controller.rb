class UsersController < ApplicationController

  # 未ログイン者のマイページへのアクセスをリダイレクト
  before_action :authenticate_user!,only: [:show]
  # 他のユーザーのshowページへのアクセスをリダイレクト
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
    if current_user.id != params[:id].to_i
    redirect_to root_path
    end
  end

end

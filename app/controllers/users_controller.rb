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
    redirect_to root_path unless user_signed_in?
  end
end

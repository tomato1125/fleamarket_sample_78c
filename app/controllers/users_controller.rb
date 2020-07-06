class UsersController < ApplicationController
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
end

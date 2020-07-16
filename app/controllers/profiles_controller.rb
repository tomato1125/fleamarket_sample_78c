class ProfilesController < ApplicationController
  before_action :set_user, only: [:new]

  def new
    @profile = Profile.new
    @user = User.find(params[:user_id])
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to current_user
    else 
      @user = User.find(params[:user_id])
      render action: :new
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :birth_date).merge(user_id: current_user.id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end

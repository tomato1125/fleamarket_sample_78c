class SendInformationsController < ApplicationController
  before_action :set_user
  before_action :maxLengthValid_sendInformation, only: [:new, :create]

  def index
    @send_informations = @user.send_informations
  end

  def new
    @send_information = SendInformation.new
  end

  def create
    @send_information = @user.send_informations.new(send_information_params)
    if @send_information.save
      redirect_to user_send_informations_path
    else
      render action: :new
    end
  end

  def edit
    @send_information = SendInformation.find_by(id: params[:id])
  end

  def update
    @send_information = SendInformation.find_by(id: params[:id])
    if @send_information.update(send_information_params)
      redirect_to user_send_informations_path(@user)
    else
      render action: :edit
    end
  end

  def destroy
    @send_information = SendInformation.find_by(id: params[:id])
    @send_information.destroy
    redirect_to user_send_informations_path(@user)
  end

  private

  def send_information_params
    params.require(:send_information).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :post_code, :prefecture_id, :city, :house_number, :apartment, :phone_number, :user_id)
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def maxLengthValid_sendInformation
    if @user.send_informations.length >= 3
      redirect_to user_send_informations_path(@user)
    end
  end

end
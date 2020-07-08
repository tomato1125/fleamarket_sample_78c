class SendInformationsController < ApplicationController
  before_action :set_user

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
    # binding.pry
    # @send_information = SendInformations.find(params[:id])
    @send_information = SendInformation.find_by(id: params[:id])
    # @send_information = @user.send_information
    # @send_informations = @user.send_informations
    # @send_information = @user.send_informations.find(send_information_params)
  end

  def update
    # binding.pry
    # @send_information = SendInformation.find(params[:id])
    # @send_information = SendInformations.new(send_information_params)
    @send_information = SendInformation.find_by(id: params[:id])
    if @send_information.update(send_information_params)
      redirect_to user_send_informations_path(@user)
    else
      render action: :edit
    end

  end

  private

  def send_information_params
    # params.require(:send_information).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :post_code, :prefecture_id, :city, :house_number, :apartment, :phone_number).merge(user_id: current_user.id)
    params.require(:send_information).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :post_code, :prefecture_id, :city, :house_number, :apartment, :phone_number, :user_id)
  end

  def set_user
    @user = User.find(current_user.id)
  end

end

class SendInformationsController < ApplicationController
  before_action :set_user

  def new
    @send_information = SendInformation.new
  end

  def create
    @send_information = @user.send_informations.new(send_information_params)
    if @send_information.save
      redirect_to root_path
    else
      flash.now[:alert] = '必須項目を入力してください。'
      render action: :new
    end
  end

  def edit

  end

  def update
  end

  private

  def send_information_params
    params.require(:send_information).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :post_code, :prefecture_id, :city, :house_number, :apartment, :phone_number, :user_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

end

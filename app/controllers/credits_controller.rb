class CreditsController < ApplicationController

  require 'payjp'

  before_action :authenticate_user!,only: [:new,:create]



  def index
  end

  def show
  end

  def new
    @credit = Credit.new
  end

  def create
    Payjp.api_key =  ENV['PAYJP_SECRET_KEY']
    if params['payjp-token'].blank?
      render :new
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @credit = Credit.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @credit.save
        redirect_to user_path(current_user.id)
      else
        render :new
      end
    end
  end

  def destroy
  end



end


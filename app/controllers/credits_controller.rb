class CreditsController < ApplicationController

  before_action :authenticate_user!,only: [:new,:create]
  before_action :set_payjp_key,only: [:new,:create]


  def index
  end

  def show
  end

  def new
    @credit = Credit.new
  end

  def create
  end

  def destroy
  end

  def set_payjp_key
    gon.payjp_public_key = ENV['PAYJP_PUBLIC_KEY']
  end

end


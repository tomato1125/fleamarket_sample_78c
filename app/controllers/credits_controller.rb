class CreditsController < ApplicationController

  before_action :authenticate_user!,only: [:new,:create]

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

end

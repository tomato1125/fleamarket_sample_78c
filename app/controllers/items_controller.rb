class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
  end

  def index
  end

  def new
  end


end

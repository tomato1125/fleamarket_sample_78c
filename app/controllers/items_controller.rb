class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @items = Item.where.not(id: @item.id).where(category_id: @item.category_id)
  end

  def index
  end

  def buy
    @item = Item.find(params[:id])
    if @item.selleruser.id == current_user.id
      flash.now[:alert] = "出品者は購入手続きはできません"
      render :show
    end
  end

  def new
  end


end

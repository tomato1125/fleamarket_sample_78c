class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @items = Item.where.not(id: @item.id).where(category_id: @item.category_id)
  end

  def index
    @parents = Itemcategory.where(ancestry: nil)
  end

  def buy
  end
  
  def new
  end


end

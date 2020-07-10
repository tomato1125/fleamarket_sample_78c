class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])

    #@items = Item.where.not(id: @item.id).where(itemcategory_id: @item.itemcategory_id)
    @parent = Itemcategory.find(@item.itemcategory_id)
    @child = @parent.children
    # binding.pry
    # @grandchild = @child.indirects
  end

  def index
    @parents = Itemcategory.where(ancestry: nil)
  end

  def buy
  end
  
  def new
  end
end


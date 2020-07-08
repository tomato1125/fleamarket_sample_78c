class ItemsController < ApplicationController

  def show
  end
  
  def index
    @parents = Itemcategory.where(ancestry: nil)
  end

  def buy
  end
  
  def new
  end
end

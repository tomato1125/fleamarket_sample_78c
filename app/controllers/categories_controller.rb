class CategoriesController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json do
       @children = Itemcategory.find(params[:parent_id]).children
      end
    end
  end

end

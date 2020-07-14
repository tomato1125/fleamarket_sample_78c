class CategoriesController < ApplicationController

  def index
    # @parents = Itemcategory.where(ancestry: nil)
    @children = Itemcategory.find(params[:parent_id]).children
    respond_to do |format|
      format.html
      format.json
    end
  end

end

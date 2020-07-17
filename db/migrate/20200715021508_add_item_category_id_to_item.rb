class AddItemCategoryIdToItem < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :itemcategory, null: false, foreign_key: true, after: :brand_id
  end
end

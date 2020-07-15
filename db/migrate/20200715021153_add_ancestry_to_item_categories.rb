class AddAncestryToItemCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :itemcategories, :ancestry, :string, after: :name
  end
end

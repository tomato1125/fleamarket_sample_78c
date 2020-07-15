class AddAncestryToItemCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :itemcategories, :ancestry, :string, null: false, after: :name
  end
end

class AddAncestryToItemcategory < ActiveRecord::Migration[6.0]
  def change
    add_column :itemcategories, :ancestry, :string
    add_index :itemcategories, :ancestry
  end
end

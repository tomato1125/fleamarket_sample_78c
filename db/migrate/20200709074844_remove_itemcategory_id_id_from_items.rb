class RemoveItemcategoryIdIdFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :itemcategory_id_id, :string
  end
end

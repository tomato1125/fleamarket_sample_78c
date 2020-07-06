class RenameUserIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :user_id, :selleruser_id
  end
end

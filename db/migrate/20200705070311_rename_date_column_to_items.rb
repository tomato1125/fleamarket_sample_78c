class RenameDateColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :date_id, :deliverydate_id
  end
end

class RemoveDeliveryfeetoitem < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :delivery_fee, :integer
  end
end

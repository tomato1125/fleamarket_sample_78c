class AddCostomeridCardidColumnsforCredits < ActiveRecord::Migration[6.0]
  def change
    add_column :credits, :customer_id, :string, null: false, after: :user_id
    add_column :credits, :card_id, :string, null: false, after: :customer_id
  end
end

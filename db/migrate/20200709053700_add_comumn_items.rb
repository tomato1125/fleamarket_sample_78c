class AddComumnItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :seller, foreign_key: { to_table: :users}
    add_reference :items, :buyer, foreign_key: { to_table: :users}
    add_reference :items, :auction, foreign_key: { to_table: :users}
  end
end

class AddBuyeruserIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :buyeruser, after: :selleruser_id
  end
end

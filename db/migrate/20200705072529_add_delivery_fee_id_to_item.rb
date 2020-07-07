class AddDeliveryFeeIdToItem < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :deliveryfee, null: false, :after => :price
  end
end

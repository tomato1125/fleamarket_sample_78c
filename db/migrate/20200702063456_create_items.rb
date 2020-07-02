class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :name, null: false
      t.text        :produce, null: false
      t.integer     :price, null: false
      t.integer     :delivery_fee, null: false
      t.references  :brand
      t.references  :category, null: false
      t.references  :condition, null: false
      t.references  :prefecture, null: false
      t.references  :date, null: false
      t.references  :user, foreign_key: true
      t.timestamps
    end
  end
end

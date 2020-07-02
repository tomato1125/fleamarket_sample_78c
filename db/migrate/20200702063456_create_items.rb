class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :name, null: false
      t.text        :produce, null: false
      t.integer     :price, null: false
      t.integer     :delivery_fee, null: false
      t.references  :brand
      t.references  :category, foreign_key: true
      t.references  :condition, foreign_key: true
      t.references  :prefecture, foreign_key: true
      t.references  :date, foreign_key: true
      t.references  :user, foreign_key: true
      t.timestamps
    end
  end
end

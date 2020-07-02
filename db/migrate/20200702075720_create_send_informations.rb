class CreateSendInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :send_informations do |t|
      t.string     :family_name, null: false
      t.string     :first_name, null: false
      t.string     :family_name_kana, null: false
      t.string     :first_name_kana, null: false
      t.integer    :post_code, null: false
      t.references :prefecture, null: false
      t.string     :city, null: false
      t.string     :house_number, null: false
      t.string     :apartment
      t.integer    :phone_number, unique: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

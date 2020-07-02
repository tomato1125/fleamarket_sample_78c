class CreateCredits < ActiveRecord::Migration[6.0]
  def change
    create_table :credits do |t|
      t.integer     :number, null: false, unique: true
      t.integer     :year, null: false
      t.integer     :month, null: false 
      t.integer     :security_code, null: false
      t.references  :user, foreign_key: true
      t.timestamps
    end
  end
end

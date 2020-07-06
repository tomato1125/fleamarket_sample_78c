class ChangeSendInformations < ActiveRecord::Migration[6.0]
  def change
    change_column :send_informations, :phone_number, :string
  end
end

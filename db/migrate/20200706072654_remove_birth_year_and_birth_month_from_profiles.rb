class RemoveBirthYearAndBirthMonthFromProfiles < ActiveRecord::Migration[6.0]
  def change
    remove_column :profiles, :birth_year
    remove_column :profiles, :birth_month
  end
end

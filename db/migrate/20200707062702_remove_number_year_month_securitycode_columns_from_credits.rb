class RemoveNumberYearMonthSecuritycodeColumnsFromCredits < ActiveRecord::Migration[6.0]
  def change
    remove_column :credits, :number
    remove_column :credits, :year
    remove_column :credits, :month
    remove_column :credits, :security_code
  end
end

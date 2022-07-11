class ChangeDateToDateTime < ActiveRecord::Migration[7.0]
  def change
    change_column :tours, :date, :datetime
    rename_column :tours, :date, :time
  end
end

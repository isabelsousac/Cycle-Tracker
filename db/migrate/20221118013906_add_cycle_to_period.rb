class AddCycleToPeriod < ActiveRecord::Migration[5.2]
  def change
    add_column :periods, :cycle_id, :integer, null: false
  end
end

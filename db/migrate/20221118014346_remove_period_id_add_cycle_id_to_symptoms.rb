class RemovePeriodIdAddCycleIdToSymptoms < ActiveRecord::Migration[5.2]
  def change
    remove_column :symptoms, :period_id, :integer
    add_column :symptoms, :cycle_id, :integer, null: false
  end
end

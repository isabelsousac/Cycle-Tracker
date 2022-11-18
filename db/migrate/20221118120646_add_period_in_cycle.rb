class AddPeriodInCycle < ActiveRecord::Migration[5.2]
  def change
    add_column :cycles, :period_start, :date, null: true
    add_column :cycles, :period_end, :date, null: true
    add_column :cycles, :period_flow, :string, null: true
  end
end
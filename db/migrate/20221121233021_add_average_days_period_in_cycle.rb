class AddAverageDaysPeriodInCycle < ActiveRecord::Migration[5.2]
  def change
    add_column :cycles, :average_period_days, :integer
  end
end

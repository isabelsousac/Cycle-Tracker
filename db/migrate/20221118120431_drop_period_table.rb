class DropPeriodTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :periods
  end
end

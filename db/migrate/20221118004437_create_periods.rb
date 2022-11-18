class CreatePeriods < ActiveRecord::Migration[5.2]
  def change
    create_table :periods do |t|
      t.date :startDate
      t.date :endDate
      t.timestamps
    end
  end
end

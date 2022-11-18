class CreateCycles < ActiveRecord::Migration[5.2]
  def change
    create_table :cycles do |t|
      t.date :start_date
      t.date :end_date
      t.integer :user_id
      t.timestamps
    end
  end
end

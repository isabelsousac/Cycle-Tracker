class CreateSymptoms < ActiveRecord::Migration[5.2]
  def change
    create_table :symptoms do |t|
      t.integer :period_id
      t.boolean :headache
      t.boolean :abdominal_pain
      t.boolean :acne
      t.boolean :constipate
      t.timestamps
    end
  end
end

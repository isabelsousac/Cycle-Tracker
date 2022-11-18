class ChangeColumnsInSymptoms < ActiveRecord::Migration[5.2]
  def change
    remove_column :symptoms, :headache, :boolean
    remove_column :symptoms, :abdominal_pain, :boolean
    remove_column :symptoms, :acne, :boolean
    remove_column :symptoms, :constipate, :boolean
    add_column :symptoms, :date, :date, null: false
    add_column :symptoms, :symptom, :string, null: false
    add_column :symptoms, :level, :integer, null: false
    add_index :symptoms, [:symptom, :date, :cycle_id], unique: true
  end
end

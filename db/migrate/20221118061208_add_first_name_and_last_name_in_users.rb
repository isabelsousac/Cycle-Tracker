class AddFirstNameAndLastNameInUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :name, :text
    add_column :users, :first_name, :text, null: false
    add_column :users, :last_name, :text, null: false
  end
end

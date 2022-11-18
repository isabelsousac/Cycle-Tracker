class AddBirthDayTakePillAndNotificationInUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :take_pill, :boolean, null: false
    add_column :users, :notification_on, :boolean, default: false
  end
end

class AddParticipantBirthdayToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :participant_birthday, :date
  end
end

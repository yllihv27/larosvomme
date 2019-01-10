class AddContactPersonToParticipations < ActiveRecord::Migration[5.2]
  def change
    add_column :participations, :contact_person_id, :integer
  end
end

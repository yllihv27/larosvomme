class AddStatusToParticipations < ActiveRecord::Migration[5.2]
  def change
    add_column :participations, :status, :integer, default: 0
  end
end

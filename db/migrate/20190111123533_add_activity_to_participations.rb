class AddActivityToParticipations < ActiveRecord::Migration[5.2]
  def change
    add_column :participations, :activity, :integer, default: 0
  end
end

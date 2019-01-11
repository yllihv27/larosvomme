class AddLevelToChildren < ActiveRecord::Migration[5.2]
  def change
    add_column :children, :level, :integer, default: 0
  end
end

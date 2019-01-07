class AddLimitToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :limit, :integer
  end
end

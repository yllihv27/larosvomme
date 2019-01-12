class AddEndDayToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :end_day, :date
  end
end

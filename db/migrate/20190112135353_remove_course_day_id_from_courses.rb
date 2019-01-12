class RemoveCourseDayIdFromCourses < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :course_day_id, :integer
  end
end

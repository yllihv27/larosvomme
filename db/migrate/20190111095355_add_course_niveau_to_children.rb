class AddCourseNiveauToChildren < ActiveRecord::Migration[5.2]
  def change
    add_column :children, :course_niveau_id, :integer
  end
end

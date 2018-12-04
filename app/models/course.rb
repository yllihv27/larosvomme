class Course < ApplicationRecord
	belongs_to :course_niveau, :optional => true
	belongs_to :course_place
	belongs_to :course_category
	belongs_to :coach
  mount_uploader :course_image, CourseImageUploader
end

class Course < ApplicationRecord
	belongs_to :course_niveau, :optional => true
	belongs_to :course_place
	belongs_to :course_category
	belongs_to :coach
  mount_uploader :course_image, CourseImageUploader
  scope :by_niveau, -> course_niveau_id { where(:course_niveau_id => course_niveau_id) }
  scope :by_place, -> course_place_id { where(:course_place_id => course_place_id) }
  scope :by_category, -> course_category_id { where(:course_category_id => course_category_id) }
end

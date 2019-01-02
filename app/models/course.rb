class Course < ApplicationRecord
	belongs_to :course_niveau, :optional => true
	belongs_to :course_place, optional: :true
	belongs_to :course_category, optional: :true
	belongs_to :coach
	has_many :members
  mount_uploader :course_image, CourseImageUploader
  paginates_per 20

  def course_day
  	I18n.localize(day, format: '%A | %b %d').split.map(&:capitalize).join(' ')
  end

  def course_name
    if course_niveau.present?
    	I18n.localize(day, format: '%A | %b %d').split.map(&:capitalize).join(' ') + (' | ') + course_category.name + (' ') + course_niveau.name + (' ') + course_place.name
    end
  end

end

class CourseNiveau < ApplicationRecord
	has_many :courses
	has_many :children
end

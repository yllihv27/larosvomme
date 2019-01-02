class Participation < ApplicationRecord
	belongs_to :member
	belongs_to :course
end

class Participation < ApplicationRecord
	belongs_to :member
	belongs_to :course
	belongs_to :child
	has_one :grandparent
end

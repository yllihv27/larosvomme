class Participation < ApplicationRecord
	belongs_to :member
	belongs_to :course
	belongs_to :child
	belongs_to :grandparent, optional: true
	belongs_to :contact_person, optional: true
	enum status: [:pending, :accepted]
	enum activity: [:not_current, :current]

end

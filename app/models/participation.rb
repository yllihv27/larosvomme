class Participation < ApplicationRecord
	belongs_to :member
	belongs_to :course
	belongs_to :child
	belongs_to :grandparent, optional: true
	belongs_to :contact_person, optional: true
	enum status: [:pending, :accepted]
	enum activity: [:not_current, :current]

	def update_participation
		if course.day.between?(Date.today - 10.days, Date.today)
  		@participation.update(activity: 'current')
		else
  		@participation.update(activity: 'not_current')
		end
	end
end

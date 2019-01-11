class Child < ApplicationRecord
	belongs_to :member
	has_many :orders
	belongs_to :course_niveau
	enum level: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10']
	def age
		now = Time.zone.now.to_date
		now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)) ? 0 : 1) if @child.present?
	end
	def order_age
		now = Time.zone.now.to_date
		now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)) ? 0 : 1)
	end

	def update_level
		@participation = Participation.where(child_id: @children)
		@child = Child.where(id: @participation.child_id)
		if @participation.current
			@child.update(level: Child.levels[(@child.level.to_i + 1).to_sym])
		end
	end
	
end

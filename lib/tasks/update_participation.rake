task update_participation: :environment do
	@participations = Participation.all

	@participations.each do |p|
		if p.course.day.between?(Date.today - 10.days, Date.today)
			p.update(activity: 'current')
		elsif p.course.day.past?
			p.update(activity: 'past')
		end
	end
end

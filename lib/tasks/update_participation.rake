task update_participation: :environment do
	@participations = Participation.all

	@participations.each do |p|
		if p.course.day.between?(Date.today - 10.days, Date.today)
			p.update(activity: 'current')
		else
			p.update(activity: 'not_current')
		end
	end
end

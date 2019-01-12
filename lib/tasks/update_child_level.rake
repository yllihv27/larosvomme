task update_child_level: :environment do
	Participation.where(activity: 'current').each do |p|
			p.child.update(level: Child.levels[(p.child.level.to_i + 1)])
			if p.child.level == 0 or 1 or 2 or 3
				p.child.update(course_niveau_id: 1)
			end
			if p.child.level == 4 or 5 or 6 or 7
				p.child.update(course_niveau_id: 2)
			end
			if p.child.level == 8 or 9 or 10
				p.child.update(course_niveau_id: 3)
			end						
	end
end
task update_child_level: :environment do
	Participation.where(activity: 'current').each do |p|
			p.child.update(level: Child.levels[(p.child.level.to_i + 1)])
			if p.child.level == 10 && p.child.course_niveau_id == 1
				p.child.update(course_niveau_id: 2, level: 0)
			end
			if p.child.level == 10 && p.child.course_niveau_id == 2
				p.child.update(course_niveau_id: 3, level: 0)
			end
	end
end
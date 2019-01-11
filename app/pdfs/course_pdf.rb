class CoursePdf < Prawn::Document
	def initialize(course, participations)
		super(top_margin: 70)
		@course = course
		@participations = participations
		#@participations = participations
		header
		deltakere
	end

	def header
		text_box("#{@course.course_day_pdf}\n#{@course.time_from.strftime('%H:%M')} - #{@course.time_to.strftime('%H:%M')}",
		    :align => :right)
		text "#{@course.course_category.name} / #{@course.course_niveau.name if @course.course_niveau}", style: :bold
		text "#{@course.course_place.name if @course.course_place}"
	end

	def deltakere
		move_down 20
		table deltakere_rows do
			row(0).font_style = :bold
			self.row_colors = ["F3F2F2", "FFFFFF"]
			self.header = true
		end
	end

	def deltakere_rows
		[["ID", "Fornavn", "Etternavn", 'Alder', 'Nivå', 'Forelder', 'Telefon', 'Hentes av']] +
		@participations.map do |p|
			[p.child.id, p.child.first_name, p.child.last_name, p.child.order_age, (p.child.course_niveau.name if p.child.course_niveau), p.member.first_name + ' ' + p.member.last_name, (p.member.phone if p.member.phone), ((p.contact_person.first_name if p.contact_person) + ' ' + (p.contact_person.last_name if p.contact_person) + ' (' + (p.contact_person.relation if p.contact_person) + ')' if p.contact_person) || ((p.grandparent.first_name if p.grandparent) + ' ' + (p.grandparent.last_name if p.grandparent) if p.grandparent)]
		end
	end

end
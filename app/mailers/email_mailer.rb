class EmailMailer < ActionMailer::Base

	def self.send_replacement_request(email, course, participations)
    @course = course
    @email = email
    @recipients = Participation.where(course_id: @course)
    #@recipients = Member.where.map(&:user_id).include? current_user.id

    #@recipients = @course.members

    @recipients.each do |recipient|
      request_replacement(recipient.member, email).deliver
    end
  end

  def request_replacement(recipient, email)
    @email = email
    mail(
			to: recipient.email,
			from: "<bestdealerchat@jonaspreisler.com>",
			subject: "Vennligst les (larosvomme.no)",
			body: "#{render 'emails/sender'}",
		  content_type: "text/html"
			)
  end


end
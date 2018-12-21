class MemberMailer < ActionMailer::Base

	def welcome(member)

		@member = member
	  #attachments["Leads (#{Date.today.strftime("%A %b %d")}).xml"] = {mime_type: 'text/xml', content: xml}
		mail(
			to: member.email,
			from: "<bestdealerchat@jonaspreisler.com>",
			subject: "Velkommen til Larosvomme.no!",
			body: "#{render 'member_mailer/welcome'}",
		  content_type: "text/html"
			)
	end

end
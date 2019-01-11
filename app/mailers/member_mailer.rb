class MemberMailer < ActionMailer::Base

	def welcome(member)
		@member = member
	  #attachments["Leads (#{Date.today.strftime("%A %b %d")}).xml"] = {mime_type: 'text/xml', content: xml}
		mail(
			to: member.email,
			from: "<bestdealerchat@jonaspreisler.com>",
			subject: "VELKOMMEN TIL LÆR Å SVØMME",
			body: "#{render 'member_mailer/welcome'}",
		  content_type: "text/html"
			)
	end

	def accepted(member, participation)
		@member = member
		@participation = participation
	  #attachments["Leads (#{Date.today.strftime("%A %b %d")}).xml"] = {mime_type: 'text/xml', content: xml}
		mail(
			to: member.email,
			from: "<bestdealerchat@jonaspreisler.com>",
			subject: "Din registrering er bekreftet!",
			body: "#{render 'member_mailer/accepted'}",
		  content_type: "text/html"
			)
	end
	def gdpr(member, children, grandparents, contact_people)
		@member = member
		@children = children
		@grandparents = grandparents
	  #attachments["Leads (#{Date.today.strftime("%A %b %d")}).xml"] = {mime_type: 'text/xml', content: xml}
		mail(
			to: member.email,
			from: "<bestdealerchat@jonaspreisler.com>",
			subject: "Dine data",
			body: "#{render 'member_mailer/gdpr'}",
		  content_type: "text/html"
			)
	end

end
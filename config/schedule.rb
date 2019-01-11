if child.course.day == Date.today
	every 1.day, :at => '4.30 am' do
  runner "YourModel.check_updated_at"
end
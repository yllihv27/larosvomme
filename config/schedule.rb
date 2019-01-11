every 2.minutes do
  runner "Participation.update_participation"
end

every 2.minutes do
  rake "Child.update_level"
end

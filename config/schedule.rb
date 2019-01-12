set :environment, "development"

every 1.day do
  rake "update_participation"
end

every 1.day do
  rake "update_child_level"
end

lock '3.11.0'

set :whenever_command, "bundle exec whenever"

set :stages, ["production"]
set :default_stage, "production"
set :ssh_options, {:forward_agent => true}
set :user, "deploy"

set :passenger_restart_with_touch, false # Note that `nil` is NOT the same as `false` here

set :application, "larosvomme"
set :repo_url, "git@github.com:jonaspreisler/larosvomme.git"

set :deploy_to, '/home/deploy/larosvomme'

append :linked_files, "config/database.yml", "config/application.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"


namespace :deploy do
	after :restart, :clear_cache do
		on roles(:web), in: :groups, limit: 3, wait: 10 do
		end
	end
end
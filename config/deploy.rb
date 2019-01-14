set :whenever_command, "bundle exec whenever"
require 'whenever/capistrano'

set :passenger_restart_with_touch, false # Note that `nil` is NOT the same as `false` here

set :application, "larosvomme"
set :repo_url, "git@github.com:jonaspreisler/larosvomme.git"

set :deploy_to, '/home/deploy/larosvomme'

append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"


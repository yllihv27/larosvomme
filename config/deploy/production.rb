set :stage, :production
server '193.69.47.103', user: 'deploy', roles: %w{app db web}

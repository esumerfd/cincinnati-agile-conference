default_run_options[:pty] = true

# be sure to change these
set :user, 'cincyagilecon'
set :domain, 'bitbashers.org'
set :application, 'cincydayofagile.org'

# the rest should be good
set :repository,  "git@github.com:esumerfd/cincinnati-agile-conference.git"
set :deploy_to, "/home/#{user}/#{application}x"
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true
set :use_sudo, false

server domain, :app, :web
role :db, domain, :primary => true

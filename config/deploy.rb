default_run_options[:pty] = true

set :ssh_options, {:forward_agent => true}

set :user, 'cincyagilecon'
set :domain, 'bitbashers.org'
set :application, 'cincydayofagile.org'

set :repository,  "git@github.com:esumerfd/cincinnati-agile-conference.git"
set :deploy_to, "/home/#{user}/#{application}"
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true
set :use_sudo, false

server domain, :app, :web
role :db, domain, :primary => true

after :deploy, "webby:deploy"

namespace :webby do  
  desc "Generate the webby site"  
  task :deploy do  
    run("cd #{deploy_to}/current && webby")
  end
end

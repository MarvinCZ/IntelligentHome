# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'IntelligentHome'
set :repo_url, 'git@github.com:MarvinCZ/IntelligentHome.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, ' /home/mbrunas.p/web/'

# Default value for :scm is :git
set :scm, :git
set :branch, "master"
set :user, "mbrunas.p"
set :rails_env, "development"
set :rvm_ruby_version, '2.2.2'
set :default_env, { rvm_bin_path: '~/.rvm/bin' }
SSHKit.config.command_map[:rake] = "#{fetch(:default_env)[:rvm_bin_path]}/rvm ruby-#{fetch(:rvm_ruby_version)} do bundle exec rake"


def thin_exec cmd
  run "cd #{current_path}; thin #{cmd.to_s} -C #{release_path}/config/thin/#{development}.yml"
end

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do	
  desc "Starts the thin application server"
  task :start do
    thin_exec :start
  end
  
  desc "Stops the thin application server"
  task :stop do
    thin_exec :stop
  end
  
  desc "Restarts the thin application server"
  task :restart do
    thin_exec :restart
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
end

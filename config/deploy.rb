# config valid only for current version of Capistrano
lock "3.7.2"

set :application, "rasp_api"
set :repo_url, "git@github.com:javierrodriguez94/rasp_api.git"
set :branch, :master
set :resque_environment_task, true
set :pty, true


set :default_shell   , "/bin/bash -l"
set :rvm_ruby_version, "2.4.0"
set :rvm_type, :user


# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/rasp_api" #'/home/USER/YOUR-APP-FOLDER'

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/application.yml')

# Default value for linked_dirs is []
#set :linked_dirs, fetch(:linked_dirs, []).
#    push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets')


namespace :deploy do
  task :install_dependencies do
    on roles(:web), in: :sequence, wait: 5 do
      #execute("cd #{release_path} && rvm use 2.4.0 && bundle install")
      within release_path do
        execute :bundle , "--without development test"
      end
    end
  end
  after :published, :install_dependencies
end


# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

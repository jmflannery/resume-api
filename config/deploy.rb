# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'resume_api'
set :repo_url, 'git@github.com:jmflannery/resume-api.git'

set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to false when not using ActiveRecord

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_nam  e
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml')
# TODO upgrade to rails 4.1 and get a secrets.yml file
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# shared_files:
#
# Files that need to be copied to the shared directory on a cold deploy
#
# source: a path in current deployed release directory
# dest: path in the deployed shared directory
#
# files will be copied from source to the dest
set :shared_files, [
  {
    source: 'config/database.yml.erb',
    dest: 'config/database.yml'
  },
  {
    source: 'config/nginx.conf.erb',
    dest: 'config/nginx.conf'
  }
]

# system_symlinks:
#
# Symlinks that must be created on a cold deploy
#
# link: a path in the deployed shared directory
# target: an absolute path that will be that target of the symlink
#
# creates symlinks
set :system_symlinks, [
  {
    link: 'config/nginx.conf',
    target: "/etc/nginx/sites-enabled/#{fetch(:application)}"
  }
]

namespace :deploy do

  after 'publishing', 'restart'

  desc "Initial cold deploy"
  task :cold do
    on roles(:app) do
      # On a cold deploy:
      # Don't check if linked files exist, instead copy them to shared dir
      Rake::Task["deploy:check:linked_files"].clear
      before 'deploy:symlink:shared', 'deploy:setup_config'
      # start, instead of restart
      Rake::Task["deploy:restart"].clear
      after 'deploy:publishing', 'puma:start'
      # Deploy
      invoke 'deploy'
    end
  end

  desc "Copy config files into shared"
  task :setup_config do
    require 'erb'
    on roles(:app) do
      within release_path do

        # Copy files shared between releases to the shared directory
        shared_files = fetch(:shared_files, [])
        shared_files.each do |shared|
          execute :mkdir, '-p', "#{shared_path}/#{Pathname(shared[:dest]).dirname}"

          # Process the files with ERB and local binding
          result = process_erb(shared[:source])
          upload! result, "#{shared_path}/#{shared[:dest]}"

          # mark file executable if configured
          if shared.fetch(:exec, false)
            execute :chmod, '+x', "#{shared_path}/#{shared[:dest]}"
          end
        end

        # Symlink system files to the necessary locations
        system_symlinks = fetch(:system_symlinks, [])
        system_symlinks.each do |symlink|
          execute :sudo, :ln, "-nfs", "#{shared_path}/#{symlink[:link]}", symlink[:target]
        end
      end
    end
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

def process_erb(path)
  StringIO.new(ERB.new(File.read(path)).result(binding))
end
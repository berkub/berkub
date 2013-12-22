# encoding: UTF-8

set :application, "berkub"
set :repo_url, "git@github.com:berkub/berkub.git"

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, "/var/www/berkub"
set :scm, :git

set :rbenv_ruby_version, "2.0.0-p353"

set :format, :pretty
set :log_level, :debug
set :pty, true

set :rails_env, :production

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp public/system public/assets}

set :rbenv_type, :user
set :rbenv_ruby, "2.0.0-p353"
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake bundle god}

SSHKit.config.command_map[:rake]  = "bundle exec rake"
SSHKit.config.command_map[:rails] = "bundle exec rails"

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 5

namespace :deploy do
  desc "Restart application"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join("tmp/restart.txt")
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      within release_path do
        execute :rake, "tmp:cache:clear"
      end
    end
  end

  after :finishing, "deploy:cleanup"
end
set :application, "inMO"
set :repository,  "set your repository location here"

set :user do
  Capistrano::CLI.ui.ask "Give me Megiteam username: "
end

role :app, "#{user}.megiteam.pl"
role :web, "#{user}.megiteam.pl"
role :db,  "sql.#{user}.megiteam.pl", primary: true

set :repository, "git@github.com:masinmo/inMO.git"
set :scm, "git"
set :branch, "master"

set :deploy_via, :remote_cache

namespace :deploy do

  desc 'overriden restart specific for megiteam'
  task :restart do
      run 'restart-app inMO'
  end

  desc 'copying essential files for production env'
  task :update_configuration, except: {no_relase: true} do
      run <<-CMD
          cp -vf #{db_config_location} #{release_path}/config/ &&
          cp -vf #{environment_settings_location} #{release_path}/
      CMD
  end

  after 'deploy:update_code' do
    run "cd #{release_path}; RAILS_ENV=production bundle exec rake assets:precompile"
  end

  after 'deploy:update', 'deploy:update_configuration'

end

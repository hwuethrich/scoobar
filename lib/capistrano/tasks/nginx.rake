namespace :nginx do
  desc "Install nginx"
  task :install do
    on roles(:web) do |host|
      execute :sudo, "apt-get -y install nginx"
    end
  end
end

after 'deploy:install', 'nginx:install'

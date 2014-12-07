namespace :deploy do
  desc 'Install everything onto the server'
  task :install do
    on roles(:all) do |host|
      execute :sudo, 'apt-get -y update'
      execute :sudo, 'apt-get -y install python-software-properties git nodejs libcurl4-openssl-dev autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libpq-dev'
    end
  end
end

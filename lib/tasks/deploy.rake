task :deploy => ['deploy:push', 'deploy:tag']

namespace :deploy do

  def app_name
    @app_name ||= begin
      url = `git config --get remote.dokku.url`
      /\S+@\S+:(\S+)/.match(url)[1]
    end
  end

  def dokku(*params)
    cmd = ['bin/dokku', *params].join(' ')
    puts 'Running "%s" ...' % cmd
    exec cmd
  end

  task :migrations => [:push, :off, :migrate, :restart, :on, :tag]
  task :rollback => [:off, :push_previous, :restart, :on]

  task :push do
    puts 'Deploying site to Heroku ...'
    puts `git push dokku master`
  end

  task :status do
    dokku 'apps:status', app_name
  end

  task :start do
    puts 'Starting app servers ...'
    dokku 'apps:restart', app_name
  end

  task :stop do
    puts 'Stopping app servers ...'
    dokku 'apps:stop', app_name
  end

  task :restart do
    puts 'Restarting app servers ...'
    dokku 'apps:restart', app_name
  end

  task :tag do
    release_name = "release-#{Time.now.utc.strftime("%Y%m%d%H%M%S")}"
    puts "Tagging release as '#{release_name}'"
    puts `git tag -a #{release_name} -m 'Tagged release'`
    puts `git push --tags dokku`
  end

  task :migrate do
    puts 'Running database migrations ...'
    dokku 'run', app_name, 'rake db:migrate'
  end

  task :off do
    puts 'Putting the app into maintenance mode ...'
    # dokku 'apps:disable', app_name
  end

  task :on do
    puts 'Taking the app out of maintenance mode ...'
    # dokku 'apps:enable', app_name
  end

  task :push_previous do
    releases = `git tag`.split("\n").select { |t| t[0..7] == 'release-' }.sort
    current_release = releases.last
    previous_release = releases[-2] if releases.length >= 2
    if previous_release
      puts "Rolling back to '#{previous_release}' ..."

      puts "Checking out '#{previous_release}' in a new branch on local git repo ..."
      puts `git checkout #{previous_release}`
      puts `git checkout -b #{previous_release}`

      puts "Removing tagged version '#{previous_release}' (now transformed in branch) ..."
      puts `git tag -d #{previous_release}`
      puts `git push dokku :refs/tags/#{previous_release}`

      puts "Pushing '#{previous_release}' to Heroku master ..."
      puts `git push dokku +#{previous_release}:master --force`

      puts "Deleting rollbacked release '#{current_release}' ..."
      puts `git tag -d #{current_release}`
      puts `git push dokku :refs/tags/#{current_release}`

      puts "Retagging release '#{previous_release}' in case to repeat this process (other rollbacks)..."
      puts `git tag -a #{previous_release} -m 'Tagged release'`
      puts `git push --tags dokku`

      puts "Turning local repo checked out on master ..."
      puts `git checkout master`
      puts 'All done!'
    else
      puts "No release tags found - can't roll back!"
      puts releases
    end
  end
end

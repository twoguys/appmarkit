namespace :themes do
  desc "Install Themes"
  task :install => :environment do
    Theme.install_themes
  end
end
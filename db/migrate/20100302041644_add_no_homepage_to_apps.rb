class AddNoHomepageToApps < ActiveRecord::Migration
  def self.up
    add_column :apps, :no_homepage, :boolean, :default => false
  end

  def self.down
    remove_column :apps, :no_homepage
  end
end

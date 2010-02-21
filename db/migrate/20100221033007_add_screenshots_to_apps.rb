class AddScreenshotsToApps < ActiveRecord::Migration
  def self.up
    add_column :apps, :screenshots, :text
  end

  def self.down
    remove_column :apps, :screenshots
  end
end

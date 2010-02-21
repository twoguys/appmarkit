class AddScreenshotUrlToThemes < ActiveRecord::Migration
  def self.up
    add_column :themes, :screenshot_url, :string
  end

  def self.down
    remove_column :themes, :screenshot_url
  end
end

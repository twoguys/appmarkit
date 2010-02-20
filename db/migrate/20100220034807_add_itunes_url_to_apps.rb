class AddItunesUrlToApps < ActiveRecord::Migration
  def self.up
    add_column :apps, :itunes_url, :string
  end

  def self.down
    remove_column :apps, :itunes_url
  end
end

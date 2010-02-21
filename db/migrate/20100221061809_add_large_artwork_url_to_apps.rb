class AddLargeArtworkUrlToApps < ActiveRecord::Migration
  def self.up
    add_column :apps, :large_artwork_url, :string
  end

  def self.down
    remove_column :apps, :large_artwork_url
  end
end

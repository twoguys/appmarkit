class AddSmallArtworkUrlToApps < ActiveRecord::Migration
  def self.up
    add_column :apps, :small_artwork_url, :string
  end

  def self.down
    remove_column :apps, :small_artwork_url
  end
end

class AddItunesIdToApps < ActiveRecord::Migration
  def self.up
    add_column :apps, :itunes_id, :string
  end

  def self.down
    remove_column :apps, :itunes_id
  end
end

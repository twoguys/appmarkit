class AddThemeIdToApps < ActiveRecord::Migration
  def self.up
    add_column :apps, :theme_id, :integer
  end

  def self.down
    remove_column :apps, :theme_id
  end
end

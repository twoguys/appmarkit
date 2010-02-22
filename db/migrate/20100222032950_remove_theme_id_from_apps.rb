class RemoveThemeIdFromApps < ActiveRecord::Migration
  def self.up
    remove_column :apps, :theme_id
  end

  def self.down
    add_column :apps, :theme_id, :integer
  end
end

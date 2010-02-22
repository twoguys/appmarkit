class AddThemeNameToApps < ActiveRecord::Migration
  def self.up
    add_column :apps, :theme_name, :string
  end

  def self.down
    remove_column :apps, :theme_name
  end
end

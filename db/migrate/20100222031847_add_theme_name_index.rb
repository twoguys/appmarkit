class AddThemeNameIndex < ActiveRecord::Migration
  def self.up
    add_index :themes, :name
  end

  def self.down
    remove_index :themes, :name
  end
end

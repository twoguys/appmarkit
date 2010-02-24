class AddFolderAndTagsToThemes < ActiveRecord::Migration
  def self.up
    add_column :themes, :folder, :string
    add_column :themes, :tags, :string
  end

  def self.down
    remove_column :themes, :tags
    remove_column :themes, :folder
  end
end

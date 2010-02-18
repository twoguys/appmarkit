class AddActsAsListPositions < ActiveRecord::Migration
  def self.up
    add_column :links, :position, :integer
    add_column :features, :position, :integer
  end

  def self.down
    remove_column :features, :position
    remove_column :links, :position
  end
end

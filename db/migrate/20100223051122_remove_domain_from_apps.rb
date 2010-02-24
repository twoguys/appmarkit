class RemoveDomainFromApps < ActiveRecord::Migration
  def self.up
    remove_column :apps, :domain
  end

  def self.down
    add_column :apps, :domain, :string
  end
end

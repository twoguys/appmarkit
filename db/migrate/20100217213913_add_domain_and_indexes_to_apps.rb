class AddDomainAndIndexesToApps < ActiveRecord::Migration
  def self.up
    add_column :apps, :domain, :string
  end

  def self.down
    remove_column :apps, :domain
  end
end

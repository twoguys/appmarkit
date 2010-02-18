class AddSubdomainToApps < ActiveRecord::Migration
  def self.up
    add_column :apps, :subdomain, :string
    
    #add_index :apps, :domain
    #add_index :apps, :subdomain
    #add_index :apps, [:domain, :subdomain]
  end

  def self.down
    #remove_index :apps, :domain
    #remove_index :apps, :subdomain
    #remove_index :apps, [:domain, :subdomain]
    
    remove_column :apps, :subdomain
  end
end

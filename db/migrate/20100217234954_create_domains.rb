class CreateDomains < ActiveRecord::Migration
  def self.up
    create_table :domains do |t|
      t.string :name, :limit => 64
      t.integer :app_id

      t.timestamps
    end
    
    add_index :domains, :app_id
    add_index :domains, :name
    
    #remove_index :apps, [:domain, :subdomain]
    remove_column :apps, :domain
  end

  def self.down
    add_column :apps, :domain, :string
    add_index :apps, [:domain, :subdomain]
    drop_table :domains
  end
end

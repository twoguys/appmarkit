class RefactorDomains < ActiveRecord::Migration
  def self.up
    drop_table :domains
    
    add_column :apps, :domain, :string
  end

  def self.down
    create_table "domains", :force => true do |t|
      t.string   "name",       :limit => 64
      t.integer  "app_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    
    
    remove_column :apps, :domain
  end
end

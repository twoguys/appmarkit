class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.string  :title
      t.string  :url
      t.integer :app_id

      t.timestamps
    end
    
    add_index :links, :app_id
  end

  def self.down
    drop_table :links
  end
end

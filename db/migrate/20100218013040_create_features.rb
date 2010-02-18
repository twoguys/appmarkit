class CreateFeatures < ActiveRecord::Migration
  def self.up
    create_table :features do |t|
      t.string :body
      t.integer :app_id

      t.timestamps
    end
    
    add_index :features, :app_id
  end

  def self.down
    remove_index :features, :app_id
    
    drop_table :features
  end
end

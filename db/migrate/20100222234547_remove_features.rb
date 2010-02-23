class RemoveFeatures < ActiveRecord::Migration
  def self.up
    drop_table :features
  end

  def self.down
    create_table "features", :force => true do |t|
      t.string   "body"
      t.integer  "app_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "position"
    end
    
  end
end

class RemoveAllPaperclipFromAppsAndRemoveScreenshots < ActiveRecord::Migration
  def self.up
    drop_table :screenshots
    
    remove_column :apps, :logo_content_type
    remove_column :apps, :logo_file_size
    remove_column :apps, :logo_file_name
    remove_column :apps, :logo_updated_at
    
    remove_column :apps, :icon_content_type
    remove_column :apps, :icon_file_size
    remove_column :apps, :icon_file_name
    remove_column :apps, :icon_updated_at
  end

  def self.down
    create_table "screenshots", :force => true do |t|
      t.string   "image_file_name"
      t.string   "avatar_content_type"
      t.integer  "avatar_file_size"
      t.datetime "avatar_updated_at"
      t.integer  "position"
      t.integer  "app_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    
    add_column :apps, :logo_content_type, :string
    add_column :apps, :logo_file_size,    :integer
    add_column :apps, :logo_file_name,    :string
    add_column :apps, :logo_updated_at,   :datetime
    
    add_column :apps, :icon_content_type,  :string
    add_column :apps, :icon_file_size,     :integer
    add_column :apps, :icon_file_name,     :string
    add_column :apps, :icon_updated_at,    :datetime
                                          
    
  end
end

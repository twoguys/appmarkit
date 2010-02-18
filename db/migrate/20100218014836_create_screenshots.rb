class CreateScreenshots < ActiveRecord::Migration
  def self.up
    create_table :screenshots do |t|
      t.string    :image_file_name
      t.string    :avatar_content_type
      t.integer   :avatar_file_size
      t.datetime  :avatar_updated_at
      t.integer   :position
      t.integer   :app_id

      t.timestamps
    end
    
    add_index :screenshots, :app_id
  end

  def self.down
    drop_table :screenshots
  end
end

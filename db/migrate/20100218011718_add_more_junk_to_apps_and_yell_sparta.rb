class AddMoreJunkToAppsAndYellSparta < ActiveRecord::Migration
  def self.up
    add_column :apps, :subtitle,          :string
    add_column :apps, :description,       :text
    add_column :apps, :author,            :string
    
    add_column :apps, :logo_file_name,    :string
    add_column :apps, :logo_content_type, :string
    add_column :apps, :logo_file_size,    :integer
    add_column :apps, :logo_updated_at,   :datetime

    add_column :apps, :icon_file_name,    :string
    add_column :apps, :icon_content_type, :string
    add_column :apps, :icon_file_size,    :integer
    add_column :apps, :icon_updated_at,   :datetime
  end

  def self.down
    remove_column :apps, :author
    remove_column :apps, :description
    remove_column :apps, :subtitle
    
    remove_column :apps, :logo_file_name
    remove_column :apps, :logo_content_type
    remove_column :apps, :logo_file_size 
    remove_column :apps, :logo_updated_at 
                                 
    remove_column :apps, :icon_file_name
    remove_column :apps, :icon_content_type
    remove_column :apps, :icon_file_size  
    remove_column :apps, :icon_updated_at 
  end
end

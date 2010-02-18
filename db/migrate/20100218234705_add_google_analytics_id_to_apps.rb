class AddGoogleAnalyticsIdToApps < ActiveRecord::Migration
  def self.up
    add_column :apps, :google_analytics_id, :string
  end

  def self.down
    remove_column :apps, :google_analytics_id
  end
end

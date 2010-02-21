class Theme < ActiveRecord::Base
  has_many :apps
  
  validates_presence_of :name
  validates_presence_of :template
  
  def screenshot_url(size="small")
    "/themes/#{self.name.slugify}/screenshot-#{size}.png"
  end
end

class Theme < ActiveRecord::Base
  has_many :apps
  
  validates_presence_of     :name
  validates_uniqueness_of   :name
  
  validates_presence_of     :template
  
  
  def screenshot_url(size="small")
    "/themes/#{self.name.slugify}/screenshot-#{size}.png"
  end
  
  
  def self.install_themes

    Dir.new("#{RAILS_ROOT}/public/themes").entries.each do |theme_name|
      #if File.directory? theme_name
      unless ['.', '..'].include? theme_name
        puts "---> Installing #{theme_name}"
        theme = Theme.find_or_create_by_name(theme_name.titleize)
        theme.template = self.read_liquid_file(theme_name)
        theme.save
      end
    end
    
  end
  
  private
  
  def self.read_liquid_file(theme_name)
    data = ''
    dir = Pathname(__FILE__).dirname.expand_path
    f = File.open("#{RAILS_ROOT}/public/themes/#{theme_name}/index.html", "r") 
    f.each_line { |line| data += line }
    data
  end
  
end

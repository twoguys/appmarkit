class Theme < ActiveRecord::Base
  has_many :apps, :foreign_key => 'theme_name', :primary_key => 'name'
  
  validates_presence_of     :name
  validates_uniqueness_of   :name
  
  validates_presence_of     :template
  
  
  def screenshot_url(size="small")
    "/themes/#{self.theme_folder}/screenshot-#{size}.png"
  end
  
  
  def self.install_themes
    puts "-----> Installing Themes"
    Dir.new("#{RAILS_ROOT}/public/themes").entries.each do |theme_name|
      unless ['.', '..','.DS_Store'].include? theme_name
        puts "-----> #{theme_name.titleize}"
        theme = Theme.find_or_create_by_name(theme_name.titleize)
        theme.template = self.read_liquid_file(theme_name)
        theme.save
      end
    end
    
    nil
  end
  
  def theme_folder
    self.name.gsub(" ", "").underscore
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

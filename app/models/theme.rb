class Theme < ActiveRecord::Base
  has_many :apps, :foreign_key => 'theme_name', :primary_key => 'name'
  
  validates_presence_of     :name
  validates_uniqueness_of   :name
  
  validates_presence_of     :template
  
  validates_presence_of     :tags
  
  
  def screenshot_url(size="small")
    "/themes/#{self.folder}/screenshot-#{size}.png"
  end

  
  def self.install_themes
    puts "-----> Installing Themes"
    Dir.new("#{RAILS_ROOT}/public/themes").entries.each do |theme_name|
      unless ['.', '..','.DS_Store'].include? theme_name
        config = YAML.load_file("#{RAILS_ROOT}/public/themes/#{theme_name}/config.yml")['theme']
        puts "-----> #{config['name']}"
        theme           = Theme.find_or_create_by_name(config['name'])
        theme.folder    = config['folder']
        theme.template  = self.read_liquid_file(theme.folder)
        theme.tags      = config['tags']
        theme.save
      end
    end
    
    nil
  end
  
  
  private
  
  def self.read_liquid_file(folder)
    data = ''
    dir = Pathname(__FILE__).dirname.expand_path
    f = File.open("#{RAILS_ROOT}/public/themes/#{folder}/index.html", "r") 
    f.each_line { |line| data += line }
    data
  end
  
end

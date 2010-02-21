class App < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :theme
   
  has_many    :features,    :order => "position",   :dependent => :destroy
  has_many    :links,       :order => "position",   :dependent => :destroy
  
  validates_presence_of   :name
  
  validates_presence_of   :subdomain
  validates_uniqueness_of :subdomain
  validates_exclusion_of  :subdomain, :in => %w( www admin )
  validates_format_of     :subdomain, :with => /^[a-z0-9-]+$/
  
  validates_presence_of   :itunes_url
  validates_format_of     :itunes_url, :with => /^http:\/\/itunes.apple.com\//
  
  # has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  # has_attached_file :icon, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  serialize :screenshots
  
  liquid_methods :name, :subtitle, :print_description, :author, :features, :links, :itunes_url_opts, :small_artwork_url, :screenshots
  
  def to_param
    "#{id} #{name}".slugify
  end
  
  def from_itunes(itunes)
    self.itunes_id          = itunes.track_view_url.scan(/id(\d+)/).first.first
    self.name               = itunes.track_name
    self.description        = itunes.description
    self.subdomain          = self.name.slugify
    self.itunes_url         = itunes.track_view_url
    self.small_artwork_url  = itunes.artwork_url60
    self.large_artwork_url  = itunes.artwork_url100
    self.screenshots        = itunes.screenshot_urls
  end
  
  def from_itunes_minimal(itunes)
    self.itunes_id          = itunes.track_view_url.scan(/id(\d+)/).first.first
    self.itunes_url         = itunes.track_view_url
    self.small_artwork_url  = itunes.artwork_url60
    self.large_artwork_url  = itunes.artwork_url100
    self.screenshots        = itunes.screenshot_urls
    self.author             = itunes.artist_name
  end
  
  def affiliate_url
    "http://click.linksynergy.com/fs-bin/stat?id=UjB6GWcy1A8&offerid=146261&type=3&subid=0&tmpid=1826&RD_PARM1=#{self.itunes_url}&partnerId=30"
  end
  
  def itunes_url_opts
    self.domain.blank? ? { :subdomain => self.subdomain } : { :host => self.domain }
  end
  
  def print_description
    self.description.gsub(/\r\n/, "<br/>")
  end
  
end

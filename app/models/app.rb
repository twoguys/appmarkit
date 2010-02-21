class App < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :theme
   
  has_many    :domains
  has_many    :features,    :order => "position"
  has_many    :screesnhots, :order => "position"
  has_many    :links,       :order => "position"
  
  validates_presence_of   :name
  
  validates_presence_of   :subdomain
  validates_uniqueness_of :subdomain
  validates_exclusion_of  :subdomain, :in => %w( www admin )
  validates_format_of     :subdomain, :with => /^[a-z0-9-]+$/
  
  validates_presence_of   :itunes_url
  
  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :icon, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  liquid_methods :name, :subtitle, :description, :author, :logo, :icon, :domains, :features, :links
  
  def to_param
    "#{id} #{name}".slugify
  end
  
  def from_itunes(itunes)
    self.name             = itunes.track_name
    self.description      = itunes.description
    self.subdomain        = self.name.slugify
    self.itunes_url       = itunes.track_view_url
  end
  
  def affiliate_url
    "http://click.linksynergy.com/fs-bin/stat?id=UjB6GWcy1A8&offerid=146261&type=3&subid=0&tmpid=1826&RD_PARM1=#{self.itunes_url}&partnerId=30"
  end
  
  def itunes_url_opts
    if self.domains.empty?
      { :subdomain => self.subdomain }
    else
      { :host => self.domains.first.name }
    end
  end
  
end

class App < ActiveRecord::Base
  belongs_to  :user
  has_many    :domains
  has_many    :features
  has_many    :screesnhots
  
  validates_presence_of   :name
  
  validates_uniqueness_of :domain
  
  validates_presence_of   :subdomain
  validates_uniqueness_of :subdomain
  validates_exclusion_of  :subdomain, :in => %w( www admin )
  validates_format_of     :subdomain, :with => /^[a-z0-9-]+$/
  
  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :icon, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  def to_param
    "#{id} #{name}".slugify
  end
end

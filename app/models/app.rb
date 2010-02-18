class App < ActiveRecord::Base
  belongs_to :user
  has_many :domains
  
  validates_presence_of   :name
  
  validates_uniqueness_of :domain
  
  validates_presence_of   :subdomain
  validates_uniqueness_of :subdomain
  validates_exclusion_of  :subdomain, :in => %w( www admin )
  validates_format_of     :subdomain, :with => /^[a-z0-9-]+$/
end

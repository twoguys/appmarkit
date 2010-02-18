class Theme < ActiveRecord::Base
  has_many :apps
  
  validates_presence_of :name
  validates_presence_of :template
end

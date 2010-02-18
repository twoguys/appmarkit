class Feature < ActiveRecord::Base
  belongs_to :app
  acts_as_list :scope => :app
  
  validates_presence_of :body
  
  liquid_methods :body
end

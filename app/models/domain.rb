class Domain < ActiveRecord::Base
  belongs_to :app
  
  validates_presence_of   :name
  validates_uniqueness_of :name
  
  #validates_format_of     :name, :with => /^http(s):\/\//
end

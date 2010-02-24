class Domain < ActiveRecord::Base
  belongs_to :app
  
  validates_presence_of   :name
  validates_uniqueness_of :name
  
  validates_format_of     :name, :with => /^\w[a-z0-9-]+[a-z0-9\-\.]+\.[a-z]+$/
end

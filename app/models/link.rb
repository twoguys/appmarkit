class Link < ActiveRecord::Base
  belongs_to :app
  acts_as_list :scope => :app
end

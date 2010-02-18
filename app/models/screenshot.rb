class Screenshot < ActiveRecord::Base
  belongs_to :app
  acts_as_list :scope => :app
  has_attached_file :image
end

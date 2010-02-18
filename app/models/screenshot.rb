class Screenshot < ActiveRecord::Base
  belongs_to :app
  has_attached_file :image
end

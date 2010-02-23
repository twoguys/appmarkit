class User < ActiveRecord::Base
  acts_as_authentic
  
  attr_accessible :username, :email, :password, :password_confirmation

  has_many :apps
  
  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    Notifier.deliver_password_reset_instructions(self)  
  end
  
end

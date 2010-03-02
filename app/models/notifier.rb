class Notifier < ActionMailer::Base
  
  default_url_options[:host] = ENV['HOST_URL']

  def password_reset_instructions(user)
    subject       '[AppMark.it] Password Reset Instructions'  
    from          'AppMark.it <noreply@appmark.it>'  
    recipients    user.email  
    sent_on       Time.now  
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)  
  end
  
end

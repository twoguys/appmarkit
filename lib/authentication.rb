module Authentication
  
  def self.included(base)
    base.helper_method :current_user
  end
  
  def login_required
    if current_user
      if authorized?
        return
      else
        render :file => "#{RAILS_ROOT}/public/401.html", :status => :unauthorized 
      end
    else
      redirect_to signin_path
    end
  end
  
  def admin_required
    if current_user
      if admin?
        return
      else
        render :file => "#{RAILS_ROOT}/public/401.html", :status => :unauthorized 
      end
    else
      redirect_to signin_path
    end
  end
  
  def authorized?
    true
  end
  
  def admin?
    current_user.admin?
  end
  
  def current_user_session  
    return @current_user_session if defined?(@current_user_session)  
    @current_user_session = UserSession.find  
  end  

  def current_user  
    @current_user = current_user_session && current_user_session.record  
  end
  
  
end
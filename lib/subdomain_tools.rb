module SubdomainTools
  
  def self.included(base)
    base.helper_method :current_app
  end
  

  # Will either fetch the current app or return nil if none is found  
  def current_app
    logger.info "[AM] Subdomain: #{current_subdomain}"
    #@app ||= App.find_by_subdomain(current_subdomain)
    @app ||= App.find(:first, :conditions => ["domain = ? or subdomain = ?", current_domain, current_subdomain])
  end  

  # This is a before_filter we'll use in other controllers  
  def app_required  
    logger.info "[AM] Current App: #{current_app}"
    unless current_app
      flash[:error] = "Could not find the app '#{current_subdomain}'"   
      redirect_to pages_url('info', :subdomain => false) and return false
    end
    true
  end  
  
end

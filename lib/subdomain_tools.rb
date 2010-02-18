module SubdomainTools
  
  def self.included(base)
    base.helper_method :current_app
  end
  

  # Will either fetch the current app or return nil if none is found  
  def current_app
    logger.info "Subdomain: #{current_subdomain}"
    logger.info "Domain: #{current_domain}"
    @app ||= App.find_by_subdomain(current_subdomain) || Domain.find_by_name(current_domain).try(:app)
  end  

  # This is a before_filter we'll use in other controllers  
  def app_required  
    if current_app
      return true
    else
      flash[:error] = "Could not find the app '#{current_subdomain}'"   
      redirect_to pages_url('welcome', :subdomain => false) and return false
    end
  end  
  
end

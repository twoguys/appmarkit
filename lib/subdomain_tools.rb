module SubdomainTools
  
  def self.included(base)
    base.helper_method :current_app
  end
  
  def current_app
    logger.info "Subdomain: #{current_subdomain}"
    logger.info "Domain: #{current_domain}"
    opts = { :include => [:links, :domains, :features, :theme] }
    @app ||= App.find_by_subdomain(current_subdomain, opts) || Domain.find_by_name(current_domain, opts).try(:app)
  end  

  def app_required  
    if current_app
      return true
    else
      flash[:error] = "Could not find the app '#{current_subdomain}'"   
      redirect_to welcome_url(:subdomain => false) and return false
    end
  end  
  
end

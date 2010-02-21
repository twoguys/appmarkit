module SubdomainTools
  
  def self.included(base)
    base.helper_method :current_app
  end
  
  def current_app
    logger.info "Subdomain: #{current_subdomain}"
    logger.info "Domain: #{current_domain}"
    opts = [:links, :features, :theme]
    #@app ||= App.find_by_subdomain(current_subdomain, :include => opts) || Domain.find_by_name(current_domain, :include => { :app => opts }).try(:app)
    @app ||= 
      App.find_by_subdomain(current_subdomain, :include => opts) || 
      App.find_by_domain(current_domain, :include => opts) ||
      App.find_by_domain("www.#{current_domain}", :include => opts)
  end  

  def app_required  
    if current_app
      return true
    else  
      redirect_to welcome_url(:subdomain => nil, :host => ENV['HOST_URL']) and return false
    end
  end  
  
end

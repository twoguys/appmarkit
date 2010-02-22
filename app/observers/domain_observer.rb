class DomainObserver < ActiveRecord::Observer
  
  def after_create(domain)
    heroku_client.add_domain(ENV['HEROKU_APP'], domain.name)
  end
  
  def after_destroy(domain)
    heroku_client.remove_domain(ENV['HEROKU_APP'], domain.name)
  end
  
  private
  
  def heroku_client
    Heroku::Client.new(ENV['HEROKU_EMAIL'], ENV['HEROKU_PASSWORD'])
  end
  
end

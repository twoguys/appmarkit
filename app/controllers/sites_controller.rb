class SitesController < ApplicationController
  
  before_filter :app_required
  
  def index
    response.headers['Cache-Control'] = 'public, max-age=300'
    render :layout => false
  end

  def itunes
    response.headers['Cache-Control'] = 'public, max-age=300'
    render :layout => false
  end
  
end
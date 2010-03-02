class SitesController < ApplicationController
  
  before_filter :app_required
  
  def index
    redirect_to itunes_path(@app.itunes_url_opts) and return if @app.no_homepage
    response.headers['Cache-Control'] = 'public, max-age=300'
    render :layout => false
  end

  def itunes
    response.headers['Cache-Control'] = 'public, max-age=300'
    render :layout => false
  end
  
end
class SitesController < ApplicationController
  
  before_filter :app_required
  
  def index
    render :layout => false
  end
  
end
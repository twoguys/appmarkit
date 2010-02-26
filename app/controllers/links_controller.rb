class LinksController < ApplicationController

  before_filter :login_required
  before_filter :find_app
  
  def create
    @link = @app.links.new(params[:link])
    if @link.save
      flash[:notice] = "Link added"
    else
      flash[:error] = "Error adding link"
    end
  end
  
  def destroy
    @link = @app.links.find(params[:id])
    @link.destroy
    flash[:notice] = "Link removed"
  end
  
  def sort
    @app.links.each do |link|
      link.position = params['app-links'].index(link.id.to_s) + 1
      link.save
    end
    render :nothing => true
  end
  
  private
  
  def find_app
    @app = current_user.apps.find(params[:app_id])
  end

end

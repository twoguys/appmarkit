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
    redirect_to @app
  end
  
  def destroy
    @link = @app.links.find(params[:id])
    @link.destroy
    flash[:notice] = "Link removed"
    redirect_to @app
  end
  
  
  private
  
  def find_app
    @app = current_user.apps.find(params[:app_id])
  end

end

class ScreenshotsController < ApplicationController

  before_filter :find_app
  
  def create
    @screenshot = @app.screenshots.new(params[:screenshot])
    if @screenshot.save
      flash[:notice] = "Screenshot added"
    else
      flash[:error] => "Error creating screenshot"
    end
    redirect_to @app
  end
  
  def destroy
    @screenshot = @app.screenshots.find(params[:id])
    @screenshot.destroy
    flash[:notice] = "Screenshot deleted"
    redirect_to @app
  end
  
  
  private
  
  def find_app
    @app = App.find(params[:app_id])
  end


end

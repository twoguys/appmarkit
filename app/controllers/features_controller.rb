class FeaturesController < ApplicationController

  before_filter :find_app
  
  def create
    @feature = @app.features.new(params[:feature])
    if @feature.save
      flash[:notice] = "Feature added"
    else
      flash[:error] = "Error creating feature"
    end
    redirect_to @app
  end
  
  def destroy
    @feature = @app.features.find(params[:id])
    @feature.destroy
    flash[:notice] = "Feature deleted"
    redirect_to @app
  end
  
  
  private
  
  def find_app
    @app = App.find(params[:app_id])
  end

end

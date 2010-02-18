class DomainsController < ApplicationController

  before_filter :find_app
  
  def create
    @domain = @app.domains.new(params[:domain])
    if @domain.save
      flash[:notice] = "Domain added"
    else
      flash[:error] = "Error creating domain"
    end
    redirect_to @app
  end
  
  def destroy
    @domain = @app.domains.find(params[:id])
    @domain.destroy
    flash[:notice] = "Domain deleted"
    redirect_to @app
  end
  
  
  private
  
  def find_app
    @app = App.find(params[:app_id])
  end
end

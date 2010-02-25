class DomainsController < ApplicationController

  before_filter :login_required
  before_filter :find_app
  
  def create
    @domain = @app.domains.new(params[:domain])
    if @domain.save
      flash[:notice] = "Domain added"
    else
      flash[:error] = "Error adding domain"
    end
    redirect_to @app
  end
  
  def destroy
    @domain = @app.domains.find(params[:id])
    @domain.destroy
    flash[:notice] = "Domain removed"
    redirect_to @app
  end
  
  
  private
  
  def find_app
    @app = current_user.apps.find(params[:app_id])
  end



end

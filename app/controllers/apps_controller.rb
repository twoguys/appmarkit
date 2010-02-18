class AppsController < ApplicationController
  
  before_filter :login_required
  
  def index
    @apps = current_user.apps
  end
  
  def show
    @app = current_user.apps.find(params[:id], :include => :domains)
  end
  
  def new
    @app = current_user.apps.new
  end
  
  def create
    @app = current_user.apps.new(params[:app])
    if @app.save
      flash[:notice] = "App created"
      redirect_to @app
    else
      flash[:error] = "Error, please try again"
      render :action => 'edit'
    end
    

  end

end

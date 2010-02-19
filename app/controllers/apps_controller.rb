class AppsController < ApplicationController
  before_filter {|c| c.nav(:apps)}
  before_filter :login_required
  
  def index
    @apps = current_user.apps
  end
  
  def show
    @app = current_user.apps.find(params[:id], :include => :domains)
  end
  
  def new
    @app = current_user.apps.new
    
    @app.name         = params[:name]
    @app.description  = params[:description]
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
  
  def search
    if params[:app]
      name = params[:app][:name]
      @app = App.new(:name => name)
      @apps = ItunesStore.find_app(name)
      #@apps = [Struct.new(:name, :artist_name).new("Nezumi" "Marshall Huss")]
    end
  end
  
  def preview
    @app = current_user.apps.find(params[:id])
    render :layout => false
  end

end

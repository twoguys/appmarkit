class AppsController < ApplicationController
  before_filter {|c| c.nav(:apps)}
  before_filter :login_required, :except => [:search, :demo]
  
  def index
    @apps = current_user.apps
  end
  
  def show
    @app = current_user.apps.find(params[:id], :include => :domains)
  end
  
  def new
    @app = current_user.apps.new
    
    if params[:id]
      @itunes = ItunesStore.find(params[:id])
      @app.from_itunes(@itunes) if @itunes
    end
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
  
  def edit
    @app = current_user.apps.find(params[:id])
    @itunes = ItunesStore.find(@app.id) if @app
  end
  
  def update
    @app = current_user.apps.find(params[:id])
    @app.update_attributes(params[:app])
    redirect_to @app
  end
  
  def search
    if params[:app]
      name = params[:app][:name]
      @app = App.new(:name => name)
      @apps = ItunesStore.find(:all, :term => name)
      #@apps = [Struct.new(:name, :artist_name).new("Nezumi" "Marshall Huss")]
    end
  end
  
  def preview
    @app = current_user.apps.find(params[:id])
    render :layout => false
  end
  
  def demo
    itunes_id = params[:app]
    itunes = ItunesStore.find(itunes_id)
    logger.info itunes.to_yaml
    @app = App.new
    @app.from_itunes(itunes)
    @app.theme = Theme.first
    render :action => 'preview', :layout => false
  end
  
end

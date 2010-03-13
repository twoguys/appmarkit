class AppsController < ApplicationController
  
  before_filter { |c| c.nav(:apps) }
  before_filter :login_required,  :except => [:search, :demo]
  before_filter :find_app,        :only   => [:edit, :update, :themes, :preview, :refresh]
  
  def index
    @apps = current_user.apps
  end
  
  def show
    @app = current_user.apps.find(params[:id], :include => [:links, :domains])
  end
  
  def new
    @app = current_user.apps.new
    @itunes     = ItunesStore.find(params[:id])
    
    if params[:id] && @itunes
      @itunes_id  = params[:id]
      @app.from_itunes(@itunes)
    else
      flash[:error] = "Invalid App, please try your search again"
      redirect_to search_apps_path
    end
    rescue Timeout::Error => e
      flash[:error] = "iTunes is taking too long to respond, please try again in a few minutes"
  end
  
  def create
    @app      = current_user.apps.new(params[:app])
    @itunes   = ItunesStore.find(params[:itunes_id])
    @app.from_itunes_minimal(@itunes)
    
    if @app.save
      flash[:notice] = "App created"
      redirect_to @app
    else
      flash[:error] = "Error, please try again"
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    @app.update_attributes(params[:app])
    redirect_to ['edit', @app]
  end
  
  def destroy
    @app = current_user.apps.find(params[:id])
    if @app.destroy
      flash[:notice] = "App deleted"
      redirect_to apps_path
    else
      render :action => 'show'
    end
  end
  
  def search
    if params[:app]
      name  = params[:app][:name]
      @app  = App.new(:name => name)
      @apps = ItunesStore.find(:all, :term => name)
    end
    rescue Timeout::Error => e
      flash[:error] = "iTunes is taking too long to respond, please try again in a few minutes"
  end
  
  def themes
    @themes = Theme.all
  end
  
  def preview
    @app.theme = Theme.find(params[:theme_id]) if params[:theme_id]
    
    render :layout => false
  end
  
  def demo
    itunes_id   = params[:app]
    itunes      = ItunesStore.find(itunes_id)
    @app        = App.new
    @app.theme  = params[:theme_id] ? Theme.find(params[:theme_id]) : Theme.first
    @app.from_itunes(itunes)
    
    render :action => 'preview', :layout => false
  end
  
  def refresh
    @app.refresh_itunes_images!
    flash[:notice] = "Refresh screenshots from iTunes"
    redirect_to @app
  end

  private
  
  def find_app
    @app = current_user.apps.find(params[:id])
  end
    
end

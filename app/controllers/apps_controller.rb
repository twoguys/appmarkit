class AppsController < ApplicationController
  
  before_filter { |c| c.nav(:apps) }
  before_filter :login_required,  :except => [:search, :demo]
  before_filter :find_app,        :only   => [:edit, :update, :themes, :preview]
  
  def index
    @apps = current_user.apps
  end
  
  def show
    @app = current_user.apps.find(params[:id], :include => [:links, :domains])
  end
  
  def new
    @app = current_user.apps.new
    
    if params[:id]
      @itunes = ItunesStore.find(params[:id])
      @itunes_id = params[:id]
      @app.from_itunes(@itunes) if @itunes
    end
  end
  
  def create
    @app = current_user.apps.new(params[:app])
    @itunes = ItunesStore.find(params[:itunes_id])
    @app.from_itunes_minimal(@itunes)
    if @app.save
      flash[:notice] = "App created"
      redirect_to @app
    else
      flash[:error] = "Error, please try again"
      render :action => 'edit'
    end
  end
  
  def edit
  end
  
  def update
    @app.update_attributes(params[:app])
    redirect_to @app
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
      name = params[:app][:name]
      @app = App.new(:name => name)
      @apps = ItunesStore.find(:all, :term => name)
    end
  end
  
  def themes
    @themes = Theme.all
  end
  
  def preview
    @app.theme = Theme.find(params[:theme_id]) if params[:theme_id]
    render :layout => false
  end
  
  def demo
    itunes_id = params[:app]
    itunes = ItunesStore.find(itunes_id)
    logger.info itunes.to_yaml
    @app = App.new
    @app.from_itunes(itunes)
    @app.theme = params[:theme_id] ? Theme.find(params[:theme_id]) : Theme.first
    render :action => 'preview', :layout => false
  end

  private
  
    def find_app
      @app = current_user.apps.find(params[:id])
    end
    
end

class Admin::AppsController < Admin::BaseController
  
  skip_before_filter :admin_required, :only => :install
  
  def index
    @apps = App.find(:all, :order => "created_at DESC")
  end
  
  def show
    @app = App.find(params[:id])
  end
  
  def new
    @theme = Theme.new
  end
  
  def destroy
    @theme = Theme.find(params[:id])
    @theme.destroy
    redirect_to admin_themes_path
  end
  
end
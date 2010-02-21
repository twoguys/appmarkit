class Admin::ThemesController < Admin::BaseController
  
  def index
    @themes = Theme.all
  end
  
  def show
    @theme = Theme.find(params[:id])
  end
  
  def new
    @theme = Theme.new
  end
  
  def create
    @theme = Theme.new(params[:theme])
    if @theme.save
      flash[:notice] = "Theme created"
      redirect_to admin_themes_path
    else
      flash[:error] = "Error creating theme"
      render :action => 'new'
    end
  end
  
  def update
    @theme = Theme.find(params[:id])
    if @theme.update_attributes(params[:theme])
      flash[:notice] = "Theme updated"
      redirect_to ['admin', @theme]
    else
      flash[:error] = "Error updating theme"
      render :action => 'edit'
    end
  end
  
  def destroy
    @theme = Theme.find(params[:id])
    @theme.destroy
    redirect_to admin_themes_path
  end
  
end
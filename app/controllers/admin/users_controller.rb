class Admin::UsersController < Admin::BaseController
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id], :include => :apps)
  end
  
end
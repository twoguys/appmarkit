class Admin::UsersController < Admin::BaseController
  
  def index
    @users = User.find(:all, :order => 'created_at DESC')
  end
  
  def show
    @user = User.find(params[:id], :include => :apps)
  end
  
end
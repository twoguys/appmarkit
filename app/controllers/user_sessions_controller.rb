class UserSessionsController < ApplicationController
  
  def new
    nav(:signin)
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      if !params[:redirect_to].blank?
        redirect_to params[:redirect_to]
      else
        redirect_to apps_path
      end
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully signed out"
    redirect_to root_url
  end
  
end

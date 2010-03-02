class UsersController < ApplicationController
  
  before_filter { |c| c.nav(:users) }
  
  def new
    nav(:signup)
    session[:new_user_redirect] = params[:redirect_to] if params[:redirect_to]
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if verify_recaptcha(:model => @user, :message => "The reCAPTCHA was incorrect, please try again") && @user.save
      flash[:notice] = "You account has been created"
      if session[:new_user_redirect]
        redirect_to session[:new_user_redirect]
        session[:new_user_redirect] = nil
      else
        redirect_to apps_path
      end
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "You account has been updated"
      redirect_to apps_path
    else
      render :action => 'edit'
    end
  end
  
  
end

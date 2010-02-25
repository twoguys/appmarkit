class UsersController < ApplicationController
  
  before_filter { |c| c.nav(:users) }
  
  def new
    nav(:signup)
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if verify_recaptcha(:model => @user, :message => "The reCAPTCHA was incorrect, please try again") && @user.save
      flash[:notice] = "You account has been created"
      redirect_to apps_path
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

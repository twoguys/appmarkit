class PagesController < ApplicationController
  
  def index
    # landing page
  end
  
  def welcome
    nav(:home)
  end
  
  def show
    redirect_to welcome_path and return if params[:page].blank?
    render params[:page]
  end
  
end
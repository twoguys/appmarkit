class PagesController < ApplicationController
  
  def index
    # landing page
  end
  
  def show
    render params[:page]
  end
  
end
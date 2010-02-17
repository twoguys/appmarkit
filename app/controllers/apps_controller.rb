class AppsController < ApplicationController
  
  before_filter :login_required
  
  def index
    @apps = current_user.apps
  end

end

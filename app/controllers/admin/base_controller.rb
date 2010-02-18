class Admin::BaseController < ApplicationController
  before_filter :admin_required
end
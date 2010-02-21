class Admin::BaseController < ApplicationController
  before_filter :admin_required
  before_filter {|c| c.nav(:admin)}
end
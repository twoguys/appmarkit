class Admin::ThemesController < Admin::BaseController
  def index
    @themes = Theme.all
  end
end
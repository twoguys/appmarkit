# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def liquid(app)
    Liquid::Template.parse(app.theme.template).render 'app' => @app, 'analytics' => google_analytics(app.google_analytics_id)
  end
  
  def google_analytics(google_analytics_id)
    if google_analytics_id
      "analytics goes here #{google_analytics_id}"
    end
  end
end

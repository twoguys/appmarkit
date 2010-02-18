ActionController::Routing::Routes.draw do |map|

  map.resources     :user_sessions
  map.resources     :users
  
  map.resources     :apps do |app|
    app.resources :features,    :only => [:create, :destroy]
    app.resources :domains,     :only => [:create, :destroy]
    #app.resources :screenshots, :only => [:create, :destroy]
  end

  map.login         "login",  :controller => "user_sessions", :action => "new"
  map.logout        "logout", :controller => "user_sessions", :action => "destroy"
  map.pages         ':page',  :controller => 'pages',         :action => 'show',    :page => /welcome/
    
  map.root          :controller => 'sites'
end

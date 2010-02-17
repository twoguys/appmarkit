ActionController::Routing::Routes.draw do |map|
  map.resources :apps
  
  map.pages   ':page', :controller => 'pages', :action => 'show', :page => /info/

  map.login         "login",  :controller => "user_sessions", :action => "new"
  map.logout        "logout", :controller => "user_sessions", :action => "destroy"

  map.resources :user_sessions
  map.resources :users
  
  map.root :controller => 'pages'
end

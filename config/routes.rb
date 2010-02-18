ActionController::Routing::Routes.draw do |map|
  map.resources :domains


  map.resources     :user_sessions
  map.resources     :users
  map.resources     :apps

  map.login         "login",  :controller => "user_sessions", :action => "new"
  map.logout        "logout", :controller => "user_sessions", :action => "destroy"
  map.pages         ':page',  :controller => 'pages',         :action => 'show',    :page => /welcome/
    
  map.root          :controller => 'sites'
end

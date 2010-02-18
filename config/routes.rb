ActionController::Routing::Routes.draw do |map|

  map.resources     :domains
  map.resources     :user_sessions
  map.resources     :users
  map.resources     :apps

  map.signin        "signin",  :controller => "user_sessions", :action => "new"
  map.signout       "signout", :controller => "user_sessions", :action => "destroy"
  map.signup        "signup",  :controller => "users",        :action => "new"
  
  map.pages         ':page',  :controller => 'pages',         :action => 'show',    :page => //
  map.welcome       'welcome', :controller => 'pages', :action => 'welcome'
    
  map.root          :controller => 'sites'
end

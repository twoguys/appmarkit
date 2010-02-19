ActionController::Routing::Routes.draw do |map|

  map.resources     :domains
  map.resources     :user_sessions
  map.resources     :users
  
  map.resources     :apps, 
    :collection => { :search => :any },
    :member     => { :preview => :get } do |app|
    app.resources :features,    :only => [:create, :destroy]
    app.resources :domains,     :only => [:create, :destroy]
    app.resources :screenshots, :only => [:create, :destroy]
    app.resources :links,       :only => [:create, :destroy]
  end

  map.signin        "signin",  :controller => "user_sessions", :action => "new"
  map.signout       "signout", :controller => "user_sessions", :action => "destroy"
  map.signup        "signup",  :controller => "users",        :action => "new"
  
  #map.pages         ':page',  :controller => 'pages',         :action => 'show',    :page => //
  map.welcome       'welcome', :controller => 'pages', :action => 'welcome'
  map.more          'more',    :controller => 'pages', :action => 'more'
  
  map.namespace :admin do |admin|
    admin.map '',   :controller => 'dashboard'
    admin.resources :themes
  end
  map.admin 'admin', :controller => 'admin/dashboard', :action => 'index'
    
  map.root          :controller => 'sites'
end

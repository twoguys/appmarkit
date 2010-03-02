ActionController::Routing::Routes.draw do |map|
  
  map.itunes        "itunes",  :controller => "sites",          :action => "itunes"
  map.signin        "signin",  :controller => "user_sessions",  :action => "new"
  map.signout       "signout", :controller => "user_sessions",  :action => "destroy"
  map.signup        "signup",  :controller => "users",          :action => "new"
  map.welcome       'welcome', :controller => 'pages',          :action => 'welcome'
  map.terms         'terms',   :controller => 'pages',          :action => 'terms'
  
  
  map.resources :apps, 
    :collection => { 
      :search => :any, 
      :demo   => :get 
    },
    :member => { 
      :preview  => :get,
      :themes   => :get
    } do |app|
      app.resources :links,       :only => [:create, :destroy], :collection => { :sort => :post }
      app.resources :domains,     :only => [:create, :destroy]
  end
  
  map.resources     :user_sessions
  map.resources     :users
  map.resources     :password_resets
  
  map.namespace :admin do |admin|
    admin.map '',   :controller => 'dashboard'
    admin.resources :apps
    admin.resources :themes, :collection => { :install => :post }
    admin.resources :users
  end
  map.admin 'admin', :controller => 'admin/dashboard', :action => 'index'
    
  map.root          :controller => 'sites'

end

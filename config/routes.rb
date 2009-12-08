ActionController::Routing::Routes.draw do |map|
  map.resources :sessions
  map.root :controller => 'sessions', :action => 'new'

  map.login 'login', :controller => 'sessions', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

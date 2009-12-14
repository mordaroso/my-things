ActionController::Routing::Routes.draw do |map|
  map.resources :things
  map.tag 'tag/:tag', :controller => 'things', :action => 'index'
  map.connect 'people/:person_id', :controller => 'things', :action => 'index', :requirements => { :person_id => /\d+/ }
  
  map.resources :loans
  map.resources :people
  map.resources :sessions

  map.login 'login', :controller => 'sessions', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'

  map.root :controller => 'things', :action => 'index'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

Forevernote::Application.routes.draw do

  root :to => 'home#index'
  match "/auth/twitter/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

end

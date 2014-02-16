Forevernote::Application.routes.draw do

  root :to => 'home#index'
  match "/auth/twitter/callback" => "sessions#create"
  match "/auth/instagram/callback" => "sessions#access"
  match "/auth/evernote/callback" => "sessions#access"
  match "/auth/facebook/callback" => "sessions#access"

  match "/test" => "evernote#create_note"
  match "/tweet" => "tweets#get_all_tweets"
  match "/instagram" => "instagrams#get_instagrams"


  match "/signout" => "sessions#destroy", :as => :signout

  resources :home

end

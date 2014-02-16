Forevernote::Application.routes.draw do

  root :to => 'home#index'
  match "/auth/twitter/callback" => "sessions#create"
  match "/auth/instagram/callback" => "sessions#access"
  match "/auth/evernote/callback" => "sessions#access"
  match "/auth/facebook/callback" => "sessions#access"

  post "/evernote_create_notebook" => "evernote#create_notebook"
  match "/tweet" => "tweets#get_all_tweets"
  match "/instagram" => "instagrams#get_instagrams"
  match "/facebook" => "facebook#get_fb"


  match "/signout" => "sessions#destroy", :as => :signout

  resources :home

end

Forevernote::Application.routes.draw do

  root :to => 'home#index'
  match "/auth/twitter/callback" => "sessions#create"
  match "/auth/instagram/callback" => "sessions#access"
  match "/auth/evernote/callback" => "sessions#access"
  match "/auth/facebook/callback" => "sessions#access"

  match "/test" => "evernote#create_note"

  match "/signout" => "sessions#destroy", :as => :signout

end

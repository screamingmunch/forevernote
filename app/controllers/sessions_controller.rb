class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)

    unless LinkedId.find_by_id(user.id)
      linkedid = LinkedId.create(name: user.name, provider: user.provider, uid: user.uid, user_id: user.id )
    end

    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end

  def access
    auth = request.env["omniauth.auth"]
    user = User.find_by_id(current_user.id)
    # binding.pry
    if LinkedId.find_by_provider_and_uid(auth.provider, auth.uid)

    elsif auth.credentials
      linkedid = LinkedId.create(name: user.name, provider: auth.provider, uid: auth.uid, user_id: user.id, token:auth.credentials.token, secret: auth.credentials.secret )
    else
      linkedid = LinkedId.create(name: user.name, provider: auth.provider, uid: auth.uid, user_id: user.id)
    end
    redirect_to root_url, :notice => "Access Granted"
  end
end
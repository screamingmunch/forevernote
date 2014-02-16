class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)

    unless Linkedid.find_by_id(user.id)
     linkedid = Linkedid.create(name: user.name, provider: auth.provider, uid: auth.uid, user_id: user.id, token:auth.credentials.token, secret: auth.credentials.secret )
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
    if Linkedid.find_by_provider_and_uid(auth.provider, auth.uid)

    elsif auth.credentials
      linkedid = Linkedid.create(name: user.name, provider: auth.provider, uid: auth.uid, user_id: user.id, token:auth.credentials.token, secret: auth.credentials.secret )
    else
      linkedid = Linkedid.create(name: user.name, provider: auth.provider, uid: auth.uid, user_id: user.id)
    end
    redirect_to root_url, :notice => "Access Granted"
  end
end
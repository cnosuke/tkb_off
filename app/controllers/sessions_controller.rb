class SessionsController < ApplicationController

  def create
    sleep 20
    auth = request.env['omniauth.auth']
    session[:oauth_token] = auth.credentials.token
    session[:oauth_token_secret] = auth.credentials.secret
    user = User.find_by_provider_and_uid(auth['provider'], auth['uid']) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to regist_path
  end
  
  def destroy
    session[:user_id] = nil
    session[:regist] = nil
    redirect_to root_path
  end
  
end

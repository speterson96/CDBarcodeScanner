class SessionsController < ApplicationController
  
  def create
    @user = User.find_or_create_from_auth_hash(env["omniauth.auth"])
    session[:user_id] = @user.id
    redirect_to root_path, notice: "Signed In"
    #TODO remove follwoing comments
   # auth= request.env["omniauth.auth"]
   # session[:omniauth] = auth.except('extra')
   # user = User.from_omniauth(env["omniauth.auth"])
   # session[:user_id] = user.id
   # redirect_to root_path, notice: "SIGNED IN"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "SIGNED OUT"
  end
end
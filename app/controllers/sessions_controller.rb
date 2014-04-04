class SessionsController < ApplicationController
  def new
    user = User.find(params[:id])
    session[:user_id] = user.id
  end
end

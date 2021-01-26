
class SessionsController < ApplicationController


  get '/login' do
    if logged_in?
       redirect '/fosters'
    else
       erb :'/users/login'
    end
 end

 post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
       session[:user_id] = user.id
       redirect '/fosters'
    else
       redirect '/signup'
    end
 end

end 
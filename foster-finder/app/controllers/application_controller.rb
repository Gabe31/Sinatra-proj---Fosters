require './config/environment'

class ApplicationController < Sinatra::Base
    configure do
    enable :sessions
    set :session_secret, "foster"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :welcome
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end

  def require_login
    unless logged_in?
      redirect '/login'
    end
  end
end 


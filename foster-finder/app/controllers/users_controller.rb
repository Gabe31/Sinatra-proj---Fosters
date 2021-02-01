class UsersController < ApplicationController

  get '/signup' do
        erb :'/users/signup'
  end 

post '/signup' do
   user = User.new(params)
   if user.save
      session[:user_id] = user.id
      redirect '/fosters'
   else
      @error = "Invalid info for login"
      erb :'/users/signup'
   end
end

#  get '/logout' do
#    if logged_in?
#      session.destroy
#      redirect '/'
#    else
#      redirect '/'
#    end
#  end

end 


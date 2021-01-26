class FosterController < ApplicationController
#create
#read
#update
#destroy

get '/fosters/new' do
    require_login
    erb :'/fosters/create'
end

post '/fosters' do
    person = current_user.fosters.new(params)
    if  person.save
        redirect '/fosters'
    else
        @error = "Please try again"
        erb :'fosters/create'
    end
end

get '/fosters' do
    @fosters = Foster.all.reverse
    erb :'fosters/index'
end


get 'fosters/:id' do
    require_login
    @foster= Foster.find(params[:id])
    @user = current_user
    if @foster
        erb :'fosters/show'
    else
        redirect '/fosters'
    end
end

get '/fosters/:id/edit' do
    require_login
    if @foster = Foster.find(params[:id])
        @user = current_user
        erb :'/fosters/edit'
    else
        redirect '/fosters'
    end
end

patch '/fosters/:id' do
    if current_user.id == session[:user_id]
        @foster = Foster.find(params[:id])
        @foster.update(name: params["name"], location: params["location"], animal: params["animal"] )
        erb :'/fosters/show'
    else
        redirect "/fosters/#{params[:id]}/edit"
    end
end

delete '/fosters/:id' do
    if current_user.id == session[:user_id]
        foster = Foster.find(params[:id])
        foster.destroy 
        redirect '/fosters'
    end
end
end



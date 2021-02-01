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


get '/fosters/:id' do
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
    @foster = current_user.fosters.find_by_id(params[:id])
    if  @foster
        erb :'/fosters/edit'
    else
        redirect '/fosters'
    end
end

patch '/fosters/:id' do
    require_login
    @foster = current_user.fosters.find_by_id(params[:id])
     if @foster
        @foster.update(name: params["name"], location: params["location"])
        redirect "/fosters/#{@foster.id}"
    else
        redirect '/fosters'
    end
end

delete '/fosters/:id' do
    require_login
    @foster = current_user.fosters.find_by_id(params[:id])
    if  @foster
        foster.destroy 
    end
        redirect '/fosters'
  end
end



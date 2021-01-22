class FosterController < ApplicationController
#create
#read
#update
#destroy

get 'fosters' do
    @fosters = Foster.all
    erb :'fosters/index'
end 


get 'fosters/:id' do
    @foster= Foster.find(params["id"])
end 

end 
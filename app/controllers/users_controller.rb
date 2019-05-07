class UsersController < ApplicationController

#render over a login page
  get '/login' do
    erb :"users/login"
  end

#render over a signup page
  get '/signup' do
    erb :"users/signup"
  end


end

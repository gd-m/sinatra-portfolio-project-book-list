class UsersController < ApplicationController


  get '/users/:id/home' do
    @user = User.find_by(:id => session[:user_id])
    @book_entries = BookEntry.all
    erb :"users/home"

  end

  get '/logout' do
    #clear session hash
    session.clear
    #redirect to welcome page
    redirect '/'
  end

  get '/users/:id/profile' do
    @user = User.find_by(:id => params[:id])
    erb :"users/profile"
  end




end

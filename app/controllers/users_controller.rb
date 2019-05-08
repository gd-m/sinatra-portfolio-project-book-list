class UsersController < ApplicationController

#render over a login page
  get '/login' do
    erb :"users/login"
  end

#purpose of this route is to receive the login form,
#find the user and log the user in( create a session)
  post '/login' do
    #find the user
    @user = User.find_by(:email => params[:email])
    #authenticate the user - verify the user is who they say they are
    #they have credientials - email/password
    if @user.authenticate(params[:password])
      #log in the user(create their session)
      session[:user_id] = @user[:id]

      #redirect the user to landing page
      redirect "/users/#{@user[:name]}"

    else
      #tell the user they enter invalid credentials
      #redirect them to login page
      redirect '/login'

    end

  end


#render over a signup page
  get '/signup' do
    erb :"users/signup"
  end

  post '/signup' do
    #i want to persist a user that has name, email AND password
    if params[:name] != "" && params[:password] != "" && params[:email] != ""
      @user = User.create(params)
      #where does the user goes next

      #the user will be logged in
      session[:user_id] = @user[:id]

      #redirect the user to landing page
      redirect "/users/#{@user[:name]}"
    else
      redirect '/signup-error'
    end

    get '/signup-error' do
      erb :signup_error
    end


  end

  get '/users/:name' do
    @user = User.find_by(session[:user_id])

    erb :"users/show"

  end




end

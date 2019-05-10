require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "my_book_application_secret"

  end

  get "/" do
  if logged_in?

  redirect "users/#{current_user.id}/home"

  else
    erb :welcome
  end

  end

  helpers do

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
      !!current_user
    end

    def current_user_books
      @books = current_user.book_entries.all
    end

    def author_count(user)
      array = []
      user.book_entries.all.each do |book_entry|
        array << book_entry.author
      end
      array.uniq.size
    end

    def authorized_to_edit?(book_entry)
      book_entry.user == current_user
    end
  end

end

class BooksController < ApplicationController
  #RESTful Routes
  #New - GET - /users/:id/books/New -direct to new entry form

  get '/users/:id/books/new' do
    erb :"books/new"
  end

  #Create - POST - /users/:id/books -add the entry to database

  post '/users/:id/books/new' do
    if !logged_in?
      redirect '/'
    end
    if params[:name] != "" && params[:author] != ""
      @book_entry = BookEntry.create(name: params[:name], author: params[:author], notes: params[:notes], user_id: current_user.id)
      redirect "/users/#{current_user.id}/books/#{@book_entry.id}"
    else
      redirect 'users/:id/books/new'
    end

  end

  #show all - GET - /users/:id/Books -show all the entries in database

  get '/users/:id/books' do
    erb :"books/index"
  end

  #show one - GET - /users/:id/books/:book_id' -show a particular entry i=of database


  get '/users/:id/books/:book_id' do
    set_book_entry
    erb :"books/show"
  end

  #edit - GET - /users/:id/books/:book_id/edit - direct to the edit form of particular entry


  get '/users/:id/books/:book_id/edit' do
    set_book_entry
    erb :"books/edit"

  end
  #update - PATCH - upade the entry which has been edited
  patch '/users/:id/books/:book_id' do
    #find the book Entry
    set_book_entry
    #assign new values to the book entry
    @book_entry.update(name: params[:name], author: params[:author], notes: params[:notes])
    #redirect to the book_entry
    redirect "/users/#{current_user.id}/books/#{@book_entry.id}"
  end


  #delete - DELETE - delete the particular entry



private

  def set_book_entry
    @book_entry = BookEntry.find(params[:book_id])
  end

end

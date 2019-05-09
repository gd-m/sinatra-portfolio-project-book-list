class BooksController < ApplicationController
  #RESTful Routes
  #New - GET - /users/:id/books/New -direct to new entry form
  #Create - POST - /users/:id/books -add the entry to database
  #show all - GET - /users/:id/Books -show all the entries in database
  #show one - GET - /users/:id/books/:book_id' -show a particular entry i=of database
  #edit - GET - /users/:id/books/:book_id/edit - direct to the edit form of particular entry
  #update - PATCH - upade the entry which has been edited
  #delete - DELETE - delete the particular entry

  get '/users/:id/books/new' do
    erb :"books/new"
  end

  post '/users/:id/books' do

  end

  get '/users/:id/books' do

  end

  get '/users/:id/books/:book_id' do

  end

  get '/users/:id/books/:book_id/edit' do
    
  end



end

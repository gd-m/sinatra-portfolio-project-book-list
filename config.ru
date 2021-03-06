require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
#This is methodd is used to send Patch and Delete request
use Rack::MethodOverride

#All the other controllers will go here with 'use'.
use UsersController
use BooksController
use SessionsController
run ApplicationController

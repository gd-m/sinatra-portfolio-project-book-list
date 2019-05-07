#WIREFRAME FOR SINATRA BOOK APPLICATION
#App Overview
I am going to build an application to store book name, it's author's name and read/unread checkbox.
user can Create new entry, Edit/update existing entry, read entry and delete entry. (CRUD)


# Book Listing- User Stories

## Users will be able to ...
- Sign Up, Sign in and Sign Out

## As an user, I can ....
- Create/ Enter a new book records/details.
- See all the book entries
- Edit my existing entries
- And Delete my  book entry


# Wireframing

## Models will be User and BookEntry

## User

### Attributes
- name
- email id
- password(because of I am using bcrypt, it will be 'password_digest' in database)

### Associations
has_many :book_entry

## BookEntry
### Attributes
- Book name
- Author Name
- Read/Unread status
- user_id

### Associations
belongs_to :user

## MVP
Users can sign in , sign up , sign out, create book entries, edit their own entries, and view their own entries

# Stretch Goals
- CSS - make looks little better
- Tests
- Include a join model
- Include category for books and list down books according to Category
- user can choose to make their entries pubkic or private.

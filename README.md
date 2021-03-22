# Alpha Blog

This is a Blog Web App. This is developed on Ruby 3.0.0. 
Features and functionality:
* Authors can sign in and register.
* Authors can write article and associate it with a category (one or many).
* Admin can create, update and delete article categories.
* View list of bloggers with associated articles.
* Can edit and delete own article.

Visit blog web app (https://ror1-test-app.herokuapp.com)

# Getting started

## Installation

Clone the repository

    git clone [repository link]

Switch to the repo folder

    cd ror-test-app

Install gems specified in gem file

    bundle install --without production
    
Start the local development server

    rails s

You can now access the server at http://localhost:3000

## Database migration and seeding

Run the database migration and seeder and you're done

    rails db:migrate
    rails db:seed

***Note*** : It's recommended to have a clean database before seeding. You can refresh your migrations at any point to clean the database by running the following command

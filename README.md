# README

rails new twitter-app # creates a new app

bundle

rails g model comment name:string user_id:integer #creates model and migrations

rails g migration add_status_to_reactions status:integer # enums migration command

rails db:migrate

User.joins(:comments).where('comments.tweet_id = ?', Tweet.last.id)
User.joins(:comments).where('comments.tweet_id' => Tweet.last.id)

gem 'devise'
gem 'twitter-bootstrap-rails'
gem 'devise-bootstrap-views'
rails generate devise:install
rails generate devise User
rails db:migrate

rails generate bootstrap:install static

rails g devise:views:bootstrap_templates

# README

rails new twitter-app # creates a new app

bundle

rails g model comment name:string user_id:integer #creates model and migrations

rails g migration add_status_to_reactions status:integer # enums migration command

rails db:migrate

User.joins(:comments).where('comments.tweet_id = ?', Tweet.last.id)
User.joins(:comments).where('comments.tweet_id' => Tweet.last.id)


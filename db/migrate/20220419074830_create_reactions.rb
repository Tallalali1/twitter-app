class CreateReactions < ActiveRecord::Migration[6.1]
  def change
    create_table :reactions do |t|
      t.text :description
      t.integer :user_id
      t.integer :tweet_id

      t.timestamps
    end
  end
end

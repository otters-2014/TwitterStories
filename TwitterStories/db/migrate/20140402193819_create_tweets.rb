class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :user_id
      t.text :text
      t.integer :rating_avg
      t.datetime :tweet_time

      t.timestamps
    end
  end
end

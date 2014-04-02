class CreateTweetStories < ActiveRecord::Migration
  def change
    create_table :tweet_stories do |t|
      t.integer :tweet_id
      t.integer :story_id

      t.timestamps
    end
  end
end

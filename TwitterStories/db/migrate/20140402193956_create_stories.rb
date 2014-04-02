class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :user_id
      t.string :title
      t.integer :rating_avg

      t.timestamps
    end
  end
end

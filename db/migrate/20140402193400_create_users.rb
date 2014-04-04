class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :twitter_key
      t.string :twitter_token

      t.timestamps
    end
  end
end

class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :rateable_id
      t.string :rateable_type
      #2 above lines same as:
      #t.references :rateable, polymorphic: true
      t.integer :rating

      t.timestamps
    end
  end
end

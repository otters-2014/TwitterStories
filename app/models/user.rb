class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :username, message: "Oh poop. That name is already taken, I'm sorry!"

  has_many :ratings
  has_many :stories
  has_many :tweets
end


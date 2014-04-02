class User < ActiveRecord::Base
  has_secure_password
  has_many :ratings
  has_many :stories
  has_many :tweets

end
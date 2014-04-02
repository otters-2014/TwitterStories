class Tweet < ActiveRecord::Base
has_many :ratings, as: :rateable
  belongs_to :user
  has_many :tweet_stories
  has_many :stories, through: :tweet_stories

end

class TweetStory < ActiveRecord::Base

  belongs_to :story
  belongs_to :tweet

end

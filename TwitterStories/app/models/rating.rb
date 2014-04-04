class Rating < ActiveRecord::Base
  belongs_to :rateable, polymorphic: true
  belongs_to :user
  has_many :comments

  def tweet
    self.where(rateable_type: "tweet")
  end
end

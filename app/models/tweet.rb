class Tweet < ActiveRecord::Base
  has_many :ratings, as: :rateable
  has_many :tags
  belongs_to :user
  has_many :tweet_stories
  has_many :stories, through: :tweet_stories

  validates :text, length: {maximum: 140}

  def tag_list
    puts "CALLED THE TAG LIST ============================================================================"
    self.tags.map{|tag| tag.name}.join(" ")
  end

  def tag_list=(tag)
    words = tag.split(' ')
    words.each do |word|
      if word.match(/\A#/)
        Tag.create(name: word, tweet_id: self.id)
      end
    end
  end

end

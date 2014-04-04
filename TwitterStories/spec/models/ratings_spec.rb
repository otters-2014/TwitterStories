require 'spec_helper'

describe Rating do
  it { should belong_to(:user) }
  it {should belong_to(:rateable)}
  it {should have_many(:comments)}


  context '#tweet' do
    it 'should return a tweet' do
      tweet = Tweet.create(text: "poop")
      rating = Rating.create(rateable_id: tweet.id, rateable_type: "tweet", rating: 11)
      expect(rating.tweet).to eq tweet
    end
  end

  context '#stories' do

  end
end

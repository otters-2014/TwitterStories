require 'spec_helper'

describe Tweets do
  let(:tweet){Tweet.create(user_id: 1, text: "My dog had a really poop.  IT WAS HUGE", rating_avg: 3)}

  it "should have text" do
    expect(tweet.text).to eq "My dog had a really poop.  IT WAS HUGE"
  end

  it 'should belong to a user' do
    expect(tweet.user.id).to eq 1
  end

  it 'should have an average rating' do
    expect(tweet.rating_avg).to eq 3
  end

  it 'should have (many) stories' do
    expect(tweet.stories).to eq []
  end
end

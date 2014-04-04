require 'spec_helper'

describe Tweet do
  it { should belong_to(:user) }
  it { should have_many(:tweet_stories) }
  it { should have_many(:stories).through(:tweet_stories) }
  it { should ensure_length_of(:text).is_at_most(140)}
end

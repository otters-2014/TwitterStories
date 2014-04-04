require 'spec_helper'

describe Story do
  it { should  have_many(:ratings) }
  it { should belong_to(:user) }
  it { should have_many(:tweet_stories) }
  it { should have_many(:tweets).through(:tweet_stories) }
end

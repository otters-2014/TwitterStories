require 'spec_helper'

describe Stories do
  let(:story){Story.create(user_id: 1, title: "My Dog's big poop")}

  it "should have a title" do
    expect(story.title).to eq "My Dog's big poop"
  end

  it 'should belong to a user' do
    expect(story.user.id).to eq 1
  end

  it 'should have tweets' do
    expect(story.tweets).to eq []
  end
end

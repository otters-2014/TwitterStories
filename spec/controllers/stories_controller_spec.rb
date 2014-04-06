require 'spec_helper'

describe StoriesController do

  describe "#new" do
    it "should create new stories" do
      story = double(:story)
      Story
        .should_receive(:new)
        .and_return(story)
        post :new
        expect(assigns(:story)).to eq story
    end
  end

  describe "#show" do
    it "should show stories" do
      id = "1"
      story = double(:story)
      Story
        .should_receive(:find)
        .with(id)
        .and_return(story)

    get :show, :id => id
    expect(assigns(:story)).to eq story
    end
  end

  describe "#create" do
    # subject { post :create, :story => {:title => "Sunday", :tweets => [assigns(:tweet)], :user_id => 1}}
    it "should create a new story" do
      tweet = Tweet.create(text: "poop")
      Tweet
        .should_receive(:find)
        .with(tweet.id)
          .and_return(tweet)
      story_params = { "story" => {"title" => "Sunday", "tweets" => [tweet.id.to_s], "user_id" => 1}}
      expect {
        post :create, story_params}.to change{ Story.count }.by(1)
    end

    it "redirects to story_url(@story)" do
        tweet = Tweet.create(text: "poop")
      Tweet
        .should_receive(:find)
        .with(tweet.id)
          .and_return(tweet)
      story_params = { "story" => {"title" => "Sunday", "tweets" => [tweet.id.to_s], "user_id" => 1}}

       post :create, story_params

       expect(response). to redirect_to(story_path(Story.last))
    end
  end
end

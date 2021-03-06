require 'spec_helper'

describe StoriesController do
  before(:each) do
    user = User.create(username: "somepoop", password: "dogpoop", password_confirmation: "dogpoop")
    session[:user_id] = user.id
    @user = user
  end

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

    # it "should raise an error if story doesn't include tweets" do
    #   our_story = double(:story)
    #   story_params = {"story" => {"tweets" => nil}}
    #   # Story.should_receive(:create).and_raise_error(our_story)
    #   # expect{post :create, story_params}.to raise_error{NoMethodError}
    #   expect{post :create, story_params}.to redirect_to(new_story_path)
    # end

    it 'should redirect to new if error thrown' do

    end

    it "redirects to story_url(@story)" do
        tweet = Tweet.create(text: "poop")
      Tweet
        .should_receive(:find)
        .with(tweet.id)
          .and_return(tweet)
      story_params = { "story" => {"title" => "Sunday", "tweets" => [tweet.id.to_s], "user_id" => 1}}

       post :create, story_params

       expect(response).to redirect_to(story_path(Story.last))
    end
  end

  describe "#edit" do
    it "should assign @story" do
      user = @user
      tweets = Tweet.create(:text => "poopy poop")
      our_story = Story.create(:title => "Whatever works")
      our_story.tweets = [tweets]
      get :edit, :id => our_story.id

      expect(assigns(:story)).to eq our_story
      expect(assigns(:tweets)).to eq our_story.tweets
    end
  end

  let(:user) {User.create(username:"poopy", password: "otterpoo", password_confirmation: "otterpoo")}
  let(:our_story) { Story.create(:title => "old title", user_id: user.id) }
  let(:tweets) {Tweet.create(:text => "poopy poop")}
  describe "#update" do

    it 'should edit a story with the params' do
      title = "new story"
      a_story = our_story
      a_story.tweets = [tweets]

      new_tweet = Tweet.create(:text => "another poop")

      story_params = {"story" => {"title" => title, "tweets" => [new_tweet]}}

      post :update, story_params.merge(:id => a_story.id.to_s)

      a_story.reload
      expect(a_story.title).to eq title
      expect(a_story.tweets.first.text).to eq "another poop"
    end

    it 'should redirect to the show action' do
      title = "new story"
      our_story.tweets = [tweets]

      new_tweet = Tweet.create(:text => "another poop")

      story_params = {"story" => {"title" => title, "tweets" => [new_tweet]}}

      post :update, story_params.merge(:id => our_story.id.to_s)

      expect(response).to redirect_to(story_path(Story.last))
    end
  end

 describe "#destroy" do
    it "should delete a story" do
      our_story.tweets = [tweets]
      expect { delete :destroy, {:id => our_story.id} }.to change { Story.count }.by(-1)
    end

    it "should redirect to the user page" do
      a_story = our_story
      delete :destroy, {:id => a_story.id}

      expect(response).to redirect_to(user_path(@user.id))
    end
  end


end

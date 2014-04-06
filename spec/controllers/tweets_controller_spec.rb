require 'spec_helper'

describe TweetsController do
  before(:each) do
    user = User.create(username: "pooplecake", password: "dogpoop", password_confirmation: "dogpoop")
    session[:user_id] = user.id
  end

  describe "#new" do
    it "should create new tweets for signed in user" do
      tweet = double(:tweet)
      Tweet
        .should_receive(:new)
        .and_return(tweet)
      post :new
      expect(assigns(:tweet)).to eq tweet
    end
  end

  describe "#create" do
    subject { post :create, :tweet => { :text => "Poo", :user_id => 1}}

    it "redirects to tweet_url(@tweet)" do
      subject.should redirect_to :action => :show,
                                  :id => assigns(:tweet).id
    end

    it "saves new tweet and creates record" do
      expect {
        post:create, {:tweet => {'text'=> "sticky pooop... And I dont have any more bags. Help please"}}
      }.to change(Tweet, :count).by(1)
    end
  end

  describe '#show' do
    it 'renders a post' do
      id = "1"
      tweet = double(:tweet)
      Tweet
        .should_receive(:find)
        .with(id)
        .and_return(tweet)

      get :show, :id => id
      expect(assigns(:tweet)).to eq tweet
    end
  end

end

require 'spec_helper'

describe TweetsController do

  describe "#new" do
    it "should create new tweets" do
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
  end




end

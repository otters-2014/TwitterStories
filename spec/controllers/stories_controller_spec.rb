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




end

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




end

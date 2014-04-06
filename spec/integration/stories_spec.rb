require 'spec_helper'

feature "making stories " do

  before(:each) do
    visit root_path
    within ('#signup-content') do  #this test is full of poop :D
      fill_in('Username', with: "poop")
      fill_in('Password', with: "poop")
      fill_in('Password confirmation', with: "poop")
      click_button('Sign Up')
    end
  end

  let(:tweet){Tweet.create(text: "something", user_id: 1)}
  scenario "user can create a new story" do
    our_tweet = tweet

    visit new_story_path

    fill_in( 'Title', with: "a poopy day")


    find(:css, "#story_tweets_" + our_tweet.id.to_s + "[value='" + our_tweet.id.to_s  +  "']").set(true)

    click_button('Create')

    expect(current_path).to eq story_path(Story.last)

    expect(page).to have_content("a poopy day")
  end
end

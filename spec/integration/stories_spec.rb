require 'spec_helper'

feature "making stories " do
  scenario "user can create a new story" do
    tweet = Tweet.create(text: "something")

    visit new_story_path

    fill_in( 'Title', with: "a poopy day")

    find(:css, "#story_tweets_" + tweet.id.to_s + "[value='" + tweet.id.to_s  +  "']").set(true)

    click_button('Create')

    expect(current_path).to eq story_path(Story.last)

    expect(page).to have_content("a poopy day")
  end
end

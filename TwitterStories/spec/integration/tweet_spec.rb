require 'spec_helper'

feature "tweeting" do
  scenario "user can create a new tweets" do
    visit new_tweet_path

    fill_in('Text', with: "dog poop is poopy")

    click_button('Create Tweet')

    expect(current_path).to eq tweet_path(Tweet.last)

    expect(page).to have_content("dog poop is poopy")
  end
end





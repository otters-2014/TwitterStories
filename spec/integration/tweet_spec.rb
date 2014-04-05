require 'spec_helper'

feature "tweeting" do

  before(:each) do
    visit root_path
    within ('#signup-content') do  #this test is full of poop :D
      fill_in('Username', with: "poop")
      fill_in('Password', with: "poop")
      fill_in('Password confirmation', with: "poop")
      click_button('Sign Up')
    end
  end

  scenario "signed_in user can create a new tweets" do
   visit new_tweet_path
    fill_in('Text', with: "dog poop is poopy")

    click_button('Create Tweet')

    expect(current_path).to eq tweet_path(Tweet.last)

    expect(page).to have_content("dog poop is poopy")
  end
end





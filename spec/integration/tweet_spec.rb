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
  let(:user){User.find_by(username: "poop")}
  let(:tweet){Tweet.create(text: "something about poop", user_id: user.id)}
  scenario "signed_in user can create a new tweets" do
   visit new_tweet_path
    fill_in('Text', with: "dog poop is poopy")

    click_button('Create Tweet')

    expect(current_path).to eq tweet_path(Tweet.last)

    expect(page).to have_content("dog poop is poopy")
  end

  scenario "user can go back from new tweet to profile" do
    visit new_tweet_path

    click_link("back")

    expect(current_path).to eq user_path(user.id)
  end

  scenario "user can go from tweet#show to profile" do
    visit tweet_path(tweet.id)

    click_link('back')

    expect(current_path).to eq user_path(user.id)
  end

  scenario "user can go back to new tweet from show tweet" do
    visit tweet_path(tweet.id)

    click_link('tweet again')

    expect(current_path).to eq new_tweet_path
  end

end





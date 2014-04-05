require 'spec_helper'

feature "the homepage"  do
  scenario "the user can see the sign up form" do
    visit root_path
    expect(page).to have_button("Sign Up")
  end

  scenario "the user can sign up" do
    visit root_path
    within( "#signup-content") do
      expect {
        fill_in("Username", with: "DanMan")
        fill_in("Password", with: "danman")
        fill_in("Password confirmation", with: "danman")
        click_button("Sign Up")
      }.to change(User, :count).by(1)
    end

  end



  # scenario "the user can sign out" do
  #   visit root_path

  #   click_button("Sign Out")


  # end

end

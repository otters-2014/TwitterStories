require 'spec_helper'

feature "new user" do
  scenario "the user can create an account" do
    visit new_user_path
    within("#signup-content") do
      fill_in('Username', with: 'superpoops')
      fill_in('Password', with: 'shadowthemepoop')
      fill_in('Password confirmation', with: 'shadowthemepoop')

      click_button('Sign Up')
    end

    expect(current_path).to eq user_path(User.last)

    expect(page).to have_content('WELCOME SUPERPOOPS!')
  end
end

feature "edit user" do
  scenario "the user can edit thier profile" do
    user = User.create(username: "superpoops", password: "poopmcpoop", password_confirmation: "poopmcpoop")
    visit(user_path(user))
    click_link('Edit Profile')

    expect(current_path).to eq edit_user_path(user)
  end
end

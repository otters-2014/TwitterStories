require 'spec_helper'

feature "new user" do
  scenario "the user sees a create account form on the page" do
    visit new_user_path

    fill_in('Username', with: 'superpoops')
    fill_in('Password', with: 'shadowthemepoop')
    fill_in('Password confirmation', with: 'shadowthemepoop')

    click_button('Sign Up')

    expect(current_path).to eq user_path(User.last)

    expect(page).to have_content('WELCOME SUPERPOOPS!')
    save_and_open_page

  end
end

require 'spec_helper'

describe User do
  it {should have_secure_password}
  it do
    user = User.create(username: "asdasdasd", password: "poo", password_confirmation: "poo")
    should validate_uniqueness_of(:username).with_message("Oh poop. That name is already taken, I'm sorry!")
  end
end

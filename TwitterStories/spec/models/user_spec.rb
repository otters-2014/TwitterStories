require 'spec_helper'

describe User do
  let(:user){User.create(username: "username", password: "password", password_confirmation: "password")}
  it 'should have a username' do
    expect(user.username).to eq "username"
  end

  it 'should require a password and password confirmation' do
    u = User.new(username: "username", password: "password")
    excpect(u.save).to eq false
  end

  it 'should not have the password saved in plain text' do
    expect(user.password_digest).to != "password"
  end

end

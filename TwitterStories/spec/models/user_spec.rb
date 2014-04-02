require 'spec_helper'

describe User do
  let(:user){User.create(username: "username", password: "password", password_confirmation: "password")}
  it 'should not have the password saved in plain text' do
    expect(user.password_digest).to != "password"
  end

end

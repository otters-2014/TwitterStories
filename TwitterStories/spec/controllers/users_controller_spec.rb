require 'spec_helper'

describe UsersController do
  describe '#new' do
    it "creates a new user" do
      user = double(:user)
      User
        .should_receive(:new)
        .and_return(user)
      get :new
      expect(assigns(:user)).to eq user
    end
  end

  describe '#create' do
    params = {'username' => "superpoops", 'password' => "poopduh", 'password_confirmation' => "poopduh"}
    let(:user) { User.new(params) }

    it "redirects if user isn't created" do
      User.should_receive(:create).with(params).and_return(user)

      post(:create, user: params)
      expect(response).to redirect_to user_path(user)
    end
  end
end



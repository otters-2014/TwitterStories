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
end



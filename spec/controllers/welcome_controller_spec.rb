require 'spec_helper'

describe WelcomeController do
  before(:each) do
    @user = User.create(username: "otherpoop", password: "dogpoop", password_confirmation: "dogpoop")
    session[:user_id] = @user.id
  end

  describe "#index" do
    it "should do something" do
      get :index
      expect(assigns(:user)).to eq @user.id
    end
  end
end

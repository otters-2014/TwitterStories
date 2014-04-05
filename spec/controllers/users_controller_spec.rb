require 'spec_helper'
require 'rack_session_access/capybara'

describe UsersController do
  before(:each) do
    session.clear
  end
  describe '#new' do
    it "creates a new user" do
      user = double(:user)
      User.should_receive(:new).and_return(user)
      get :new
      expect(assigns(:user)).to eq user
    end
  end

  describe '#create' do
    params = {'username' => "zxcvvv", 'password' => "poopduh", 'password_confirmation' => "poopduh"}
    let(:our_user) { User.create(params)}

    it "redirects if user is created" do
      user = our_user
      User.should_receive(:new).with(params).and_return(user)
      user.should_receive(:save).and_return(true)
      post(:create, user: params)
      expect(response).to redirect_to user_path(user)
    end

    it "redirects to homepage if user isn't created" do
      user = our_user
      User.should_receive(:new).with(params).and_return(user)
      user.should_receive(:save).and_return(false)
      post(:create, user: params)
      expect(response).to redirect_to root_path
    end

    it "should store the new user in a session" do
      user = our_user
      User.should_receive(:new).with(params).and_return(user)
      post(:create, user: params)
      expect(session[:user_id]).to eq user.id
    end
  end


  describe '#show' do
    it 'renders a post' do
      user = double(:user)
      User.should_receive(:find).with("1").and_return(user)
      get :show, :id => "1"
      expect(assigns(:user)).to eq user
    end


  end
end

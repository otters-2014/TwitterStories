require 'spec_helper'

describe UsersController do
  describe '#new' do
    it "creates a new user" do
      user = double(:user)
      User.should_receive(:new).and_return(user)
      get :new
      expect(assigns(:user)).to eq user
    end
  end

  describe '#create' do
    params = {'username' => "superpoops", 'password' => "poopduh", 'password_confirmation' => "poopduh"}
    let(:our_user) { User.new(params) }

    it "redirects if user is created" do
      User.should_receive(:create).with(params).and_return(our_user)

      post(:create, user: params)
      expect(response).to redirect_to user_path(our_user)
    end

    it "renders new user form if user isn't created" do
      User.should_receive(:create).with(params).and_return(our_user)
      our_user.should_receive(:save).and_return(false)
      post(:create, user: params)
      expect(response).to render_template(:new)
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



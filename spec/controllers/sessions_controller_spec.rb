require 'spec_helper'

describe SessionsController do
  describe '#create' do
    let(:params) { {'id'=>1,'username' => "superpoops", 'password' => "poopduh", 'password_confirmation' => "poopduh"} }
    let(:our_user) { User.new(params) }

    it "should store their session with valid credentials" do

      User.should_receive(:find_by_username)
        .with(params["username"])
        .and_return(our_user)

      our_user.should_receive(:authenticate)
        .with(params["password"])
        .and_return(true)

      post :create, params

      expect(our_user.id).to_not be_nil

      expect(session[:user_id]).to_not be_nil
      expect(session[:user_id]).to eq our_user.id
    end

    it "should not store their session with invalid credentials" do
      User.should_receive(:find_by_username)
        .with(params["username"])
        .and_return(our_user)

      our_user.should_receive(:authenticate)
        .with(params["password"])
        .and_return(false)

      post :create, params

      expect(response).to redirect_to root_path
    end

    describe '#destroy' do
      it "should set session id to nil" do
        session[:user_id] = 5
        expect(session[:user_id]).to_not be_nil
        delete :destroy, {:id => 5}
        expect(session[:user_id]).to be_nil
        expect(response).to redirect_to root_path
      end
    end
  end
end

require 'spec_helper'

describe SessionsController do
  describe '#sign_in' do
    params = {'username' => "superpoops", 'password' => "poopduh", 'password_confirmation' => "poopduh"}
    let(:our_user) { User.new(params) }

    # it "should store their session" do
    #   # User.should_receive(:create).with(params).and_return(our_user)
    #   expect {
    #   User.should_receive(:create).with(params).and_return(our_user)
    #   get(:new, :user => our_user)
    #   }.to change(session[:user_id])
    # end

    # it "should redirect user to user_page" do
    #   params = {:username => "dan", :password => "dan"}

    #   user = User.create(params)
    #   post(:create, :username => "dan", :password => "dan" )
    #   expect(response).to redirect_to root_path


    # end
  end
end

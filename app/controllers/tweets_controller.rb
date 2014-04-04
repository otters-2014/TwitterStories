class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(:text => tweet_params[:text], :user_id => session[:user_id])
    if @tweet.save
      redirect_to @tweet
    else
      render 'new'
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

private
  def tweet_params
    params.require(:tweet).permit(:text)
  end
end

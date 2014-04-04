class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    render json: @tweet
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

private
  def tweet_params
    params.require(:tweet).permit(:text)
  end
end

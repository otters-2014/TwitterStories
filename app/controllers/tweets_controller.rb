class TweetsController < ApplicationController
  def new
    if current_user
      @user = current_user
      @tweet = Tweet.new
    else
      redirect_to root_path
    end
  end

  def create
    @tweet = Tweet.create!(:text => tweet_params[:text], :user_id => session[:user_id])
    puts tweet_params[:tag_list].to_s
    @tweet.tag_list = tweet_params[:tag_list]
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
    params.require(:tweet).permit(:text, :tag_list)
  end
end

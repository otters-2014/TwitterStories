class StoriesController < ApplicationController
  layout "application"

  def new
    user = User.find(session[:user_id])
    @story = Story.new
    @tweets = user.tweets
  end

 def show
  if current_user
    @user = current_user
  else
    @user = User.new
  end
   @story = Story.find(params[:id])
   puts params.inspect
  end

  def create
    @story = Story.create!(:title => story_params[:title], :user_id => session[:user_id])
    @story.tweets = story_params[:tweets].map{|tweet|  Tweet.find(tweet.to_i)}
    if @story.save
      redirect_to @story
    else
      render 'new'
    end
  end

  def edit
    user = User.find(session[:user_id])
    @story = Story.find(params[:id])
    @tweets = @story.tweets
  end

  def update
    @story = Story.find(params[:id])
    @story.update!(:title => story_params[:title])
    @story.tweets  = story_params[:tweets].map{|tweet| Tweet.find(tweet.to_i)}
    if @story.save
      redirect_to @story
    else
      render 'edit'
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    redirect_to stories_path
  end

  private
  def story_params
    params.require(:story).permit(:title, tweets: [])
  end


end

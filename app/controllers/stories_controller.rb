class StoriesController < ActionController::Base
  layout "application"

  def new
    user = User.find(session[:user_id])
    @story = Story.new
    @tweets = user.tweets
  end

 def show
   @story = Story.find(params[:id])
   puts params.inspect
  end

  def create
    @story = Story.create!(:title => story_params[:title], :user_id => session[:user_id])
    story_params[:tweets].map{|tweet| @story.tweets << Tweet.find(tweet.to_i)}
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
    story_params[:tweets].map{|tweet| @story.tweets << Tweet.find(tweet.to_i)}
    if @story.save
      redirect_to @story
    else
      render 'edit'
    end
  end

  private
  def story_params
    params.require(:story).permit(:title, tweets: [])
  end


end

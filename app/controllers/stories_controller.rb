class StoriesController < ActionController::Base
  layout "application"

  def new
    @tweets = Tweet.all
    @story = Story.new
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

  private
  def story_params
    params.require(:story).permit(:title, tweets: [])
  end


end

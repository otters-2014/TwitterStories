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
    puts story_params
    @story = Story.create!(:title => story_params[:title], :user_id => session[:user_id])
    # @story.tweets.concat(s)
    if @story.save
      redirect_to @story
    else
      render 'new'
    end
  end

  private
  def story_params
    params.require(:story).permit(:title)
  end


end

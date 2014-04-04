class StoriesController < ActionController::Base
  layout "application"

  def new
    @story = Story.new
  end

 def show
    @story = Story.new
    @tweets = Tweet.all
  end
end

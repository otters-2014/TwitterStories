class StoriesController < ActionController::Base
  layout "application"

  def new
    @tweets = Tweet.all
    @story = Story.new
  end

 def show
   @story = Story.find(params[:id])
  end

  def create
    @story = Story.create
  end


end


 # @story = Story.new
 #    @tweets = Tweet.all

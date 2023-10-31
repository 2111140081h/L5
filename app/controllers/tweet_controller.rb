class TweetController < ApplicationController
  before_action :set_tweet, only: [:destroy]
  def index
    @tweets = Tweet.all
    render "index"
  end

  def new
  end

  def create
    @tweet = Tweet.new(message: params[:message], user_id: session[:uid])
    @tweet.save
    redirect_to tweet_index_path
  end

  def destroy
    @tweet.destroy
    redirect_to tweet_index_path
  end
  
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end

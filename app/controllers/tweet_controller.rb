class TweetController < ApplicationController
  before_action :set_tweet, only: [:destroy]
  def index
    @tweets = Tweet.all
    render "index"
  end

  def new
  end

  def create
    @tweet = Tweet.new(message: params[:message], user_name: session[:login_uid])
    @tweet.user_id = current_user.id
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

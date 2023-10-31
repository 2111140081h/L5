class TopController < ApplicationController
  def main
    render "login"
  end

  def login
    @users = User.all
    @users.each do |user|
      if params[:uid] == user[:uid] && BCrypt::Password.new(user[:password_digest]) == params[:pass]
        @user = user
        break  # ユーザーが見つかったらループを終了
      end
    end
    
    if @user
      session[:uid] = params[:uid]
      redirect_to tweet_index_path
    else
      redirect_to tweet_index_path
    end
  end

  def logout
    session[:uid] = nil
    redirect_to root_path
  end
  
  def failed
    render "failed"
  end
end

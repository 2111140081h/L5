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
      session[:login_uid] = params[:uid]
      redirect_to top_main_path
    else
      redirect_to top_failed_path
    end
  end

  def logout
    session[:login_uid] = nil
    redirect_to root_path
  end
end

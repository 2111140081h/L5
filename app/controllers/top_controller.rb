class TopController < ApplicationController
  def main
    render "login"
  end

  def login
    @user = User.find_by(uid: params[:uid])
    if @user != nil
      login_password = BCrypt::Password.new(@user.password_digest)
      if login_password == params[:pass]
        session[:login_uid] = @user.uid
        redirect_to top_main_path
      else
        redirect_to tweet_index_path
      end
    end
  end

  def logout
    session[:login_uid] = nil
    redirect_to root_path
  end
  
  def failed
    render "failed"
  end
end

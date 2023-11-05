require 'bcrypt'

class TopController < ApplicationController
  def main
    render "login"
  end

  def login
    user = User.find_by(uid: params[:uid])
    if user
      if BCrypt::Password.new(user.password) == params[:pass]
        session[:login_uid] = user.uid
        redirect_to tweet_index_path
      else
        redirect_to top_main_path
      end
    else
      redirect_to top_main_path
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

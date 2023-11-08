class UsersController < ApplicationController
  before_action :set_user, only: [:destroy]
  
  def index
    @users = User.all
    # render "index"
  end

  def new
  end

  def create  #signin feature
  
    @user = User.new(
      uid: params[:uid],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      age: params[:age])
    if @user.save
      redirect_to users_path
    else
      render 'index'
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "ユーザーは正常に削除されました!" }
      format.json { head :no_content }
    end
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end

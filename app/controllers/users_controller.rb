class UsersController < ApplicationController
  before_action :set_user, only: [:destroy]
  
  def index
    @users = User.all
    render "index"
  end

  def new
  end

  def create  #signin feature
    existing_user = User.find_by(uid: params[:uid])
    
    if existing_user
      redirect_to root_path, notice: "入力されたユーザー名は既に存在しています!"
    else
      #uidとpassword_digestのデータベースへの保存
      bcrypted_pass = BCrypt::Password.create(params[:pass])
      @user = User.new(uid: params[:uid], password_digest: bcrypted_pass, age: params[:age])
      @user.save
    end
    
    redirect_to 
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

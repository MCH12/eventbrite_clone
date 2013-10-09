class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to user_path(@user)
    else
      @errors = @user.errors
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @title = @user.username
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to signup_path
  end

end

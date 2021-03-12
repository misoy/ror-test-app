class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def edit
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to Alpha Blog #{ @user.username }, you have successfuly signed up."
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def update
    if @article.update(user_params)
      flash[:notice] = "Your account information was successfully updated."
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_notice_msg(msg)
    flash[:notice] = "User was #{ msg } successfuly."
  end
end
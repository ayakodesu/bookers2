class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end


  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    if @user.save
    redirect_to user_path(@user)
    else
    @users = User.all
    @user = current_user
    render :index
    end
  end




  def index
      @user = User.new
      @users = User.all
      @user = current_user


  end



  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :title, :body)
  end

end
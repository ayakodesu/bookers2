class UsersController < ApplicationController
def new
  @user = User.new
end

def show
  @user = User.find_by(params[:id])
  @book = Book.find(params[:id])
end

def edit
  @user = User.find_by(params[:id])
end

def update
  @user = User.find(params[:id])
  @user.update(user_params)
  redirect_to user_path(@user)
end

def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
if @book.save
  redirect_to book_path(@book)
else
  @books = Book.all
  @user = current_user
  render :index
end




def index
    @users = User.all
    @user = current_user
end

private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :title, :body)
  end

end
end
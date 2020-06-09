class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    User.create(user_params)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.nickname = params[:user][:nickname]
    @user.email = params[:user][:email]
    @user.image = params[:user][:image]
    @user.update(user_params)
    if params[:user][:image]
      @user.image_name = "#{@user.id}.jpg"
      @user.save
      image = params[:user][:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
  end

  def search
    user_search = UserSearch.new(params_user_search)
    @users = user_search.execute
  end

  private
  def user_params
    params.require(:user).permit(:name, :age, :address, :email, :image, :nickname)
  end

  def params_user_search
    params.permit(:search_name, :search_email)
  end
end

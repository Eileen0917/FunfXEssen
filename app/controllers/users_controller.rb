class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update, :destroy]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "User was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user.destroy if @user
    redirect_to users_path, notice: "User was successfully deleted."
  end

  private
  def user_params
    params.require(:user).permit(:name, dislikes_attributes: [:user_id, :category_id])
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end

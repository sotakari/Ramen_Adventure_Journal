class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "変更が完了しました"
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :is_active)
  end

end

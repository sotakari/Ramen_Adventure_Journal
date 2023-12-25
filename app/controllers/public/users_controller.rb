class Public::UsersController < ApplicationController
before_action :authenticate_user!
before_action :set_current_user
before_action :ensure_guest_user, only: [:edit]

  def show
    @reviews = @user.reviews.page(params[:page]).per(8)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to mypage_path, notice: '会員情報の更新が完了しました'
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @user = current_user
    @user.update(is_active: false)
    reset_session
    redirect_to root_path, notice: '退会処理が完了しました'
  end

  private

  def set_current_user
    @user = current_user
  end

  def ensure_guest_user
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end

end

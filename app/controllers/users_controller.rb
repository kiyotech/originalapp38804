class UsersController < ApplicationController
  def index
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update(user_params)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_date, :self_introduction)
  end
end

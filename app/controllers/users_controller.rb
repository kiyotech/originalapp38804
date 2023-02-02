class UsersController < ApplicationController
  def index
    @user = current_user
    @resumes = Resume.all.includes(:user).order('created_at DESC')
  end

  def edit
    @user = User.find(params[:id])
    if !(@user == current_user)
      redirect_to root_path
    end
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_date, :self_introduction)
  end
end

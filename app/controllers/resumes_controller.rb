class ResumesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_resume, only: [:edit, :show, :update, :destroy]
  
  def index
    @resumes = Resume.all.includes(:user).order('created_at DESC')
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    if @resume.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    if !(@resume.user == current_user)
      redirect_to root_path
    end
  end

  def update
    if @resume.update(resume_params)
      redirect_to resume_path(@resume.id), method: :get
    else
      render :edit
    end
  end
  
  def show
  end

  def destroy
    if @resume.user == current_user
      @resume.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def resume_params
    params.require(:resume).permit(:title, :image, :resume_text, :answer, :price).merge(user_id: current_user.id)
  end
  def set_resume
    @resume = Resume.find(params[:id])
  end
end


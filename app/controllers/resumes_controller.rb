class ResumesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
  end

  def create
    Resume.create(resume_params)
  end

  def edit
  end
  
  def show
  end

  private
  def resume_params
    params.require(:resume).permit(:title, :image, :resume_text, :price).merge(user_id: current_user.id)
  end
  
end

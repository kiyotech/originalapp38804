class ResumesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
  end

  def create
    Resume.create(resume_params)
  end

  private
  def resume_params
    params.require(:resume).permit(:title, :imag, :resume_text, :price).merge(user_id: current_user.id)
  end
  
end

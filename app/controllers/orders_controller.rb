class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_resume

  def index
    redirect_to root_path if @resume.user == current_user 
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      render :show
    else
      render :index
    end
  end

  def show
    @resume = Resume.find(params[:id])
    @order = Order.find(params[:id])
  end 

  private

  def order_params
    params.require(:order).permit(:phone_number).merge(
      user_id: current_user.id, resume_id: params[:resume_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @resume.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_resume
    @resume = Resume.find(params[:resume_id])
  end
end


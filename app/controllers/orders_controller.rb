class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :check_member, only: [:show]

  def new
    @order = current_cart.order
  end

  def index
    @orders = Order.where(member_id: current_member.id)
    @courses = Course.all
  end

  def show
    @order_items = OrderItem.where(order_id: @order.id)
  end

  def create
    @order = current_cart.order

    if @order.update_attributes(order_params.merge(status: 'open'))
      session[:cart_token] = nil
      redirect_to @order, alert: 'Ordre er fuldført'
    else
      render :new
    end
  end

  private

  def check_member
    if current_member.id != @order.member_id
      redirect_to root_url, alert: "Kan ikke finde din ordre."
    end
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:first_name, :last_name, :member_id, :email, :sub_total)
  end

end

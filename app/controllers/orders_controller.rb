class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def new
    @order = current_cart.order
  end

  def show
    @order_items = OrderItem.where(order_id: @order.id)
  end

  def create
    @order = current_cart.order
    @items = Item.all

    if @order.update_attributes(order_params.merge(status: 'open'))
      session[:cart_token] = nil
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:first_name, :last_name)
  end

end

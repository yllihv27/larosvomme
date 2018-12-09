class OrderItemsController < ApplicationController
  before_action :authenticate_member!

  def index
    @items = current_cart.order.items
  end

  def create
    current_cart.add_item(
      course_id: params[:course_id],
      quantity: params[:quantity]
    )

    redirect_to kurv_path
  end

  def destroy
    current_cart.remove_item(id: params[:id])
    redirect_to kurv_path
	end

  private
  def authenticate_member!
    unless current_member
      flash[:notice] = 'Du må logge inn først for å bestille.'
      redirect_to new_member_session_path
    end
  end

end
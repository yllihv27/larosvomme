class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :check_member, only: [:show]

  def new
    @order = current_cart.order
    @items = current_cart.order.items
    @child = @order.children.build
    render layout:'order'
  end

  def index
    @orders = Order.where(member_id: current_member.id)
    @courses = Course.all
  end

  def show
    @order_items = OrderItem.where(order_id: @order.id)
    @participations = Participation.where(order_id: @order)
    @participation = Participation.where(order_id: @order)
    #@grandparents = Grandparent.where(order_id: @order)
  end

  def create
    @order = current_cart.order
    @items = current_cart.order.items
    #@children = current_member.children
    if params[:child_ids].present?
      @children = Child.find(params[:child_ids])
      @children.each do |child|
        @items.each do |item|
          Participation.create!([{member_id: "#{current_member.id}", course_id: "#{item.course.id}", child_id: "#{child.id}", grandparent_id: "#{@grandparent.id if @grandparent.present?}", contact_person_id: "#{@contact_person.id if @contact_person.present?}", order_id: "#{@order.id}"}])
        end
      end
    end
    if params[:child_first_name].present? && params[:child_last_name].present? && params[:order][:participant_birthday].present?
      Child.create!([{first_name: params[:child_first_name], last_name: params[:child_last_name], birthdate: params[:order][:participant_birthday], member_id: "#{current_member.id}", course_niveau_id: "1"}])
      @items.each do |item|
        Participation.create!([{member_id: "#{current_member.id}", course_id: "#{item.course.id}", child_id: "#{Child.last.id}", grandparent_id: "#{@grandparent.id if @grandparent.present?}", contact_person_id: "#{@contact_person.id if @contact_person.present?}", order_id: "#{@order.id}"}])
      end
    end

    if params[:grandparent_id].present?
      @grandparent = Grandparent.find(params[:grandparent_id])
    end
    if params[:contact_person_id].present?
      @contact_person = ContactPerson.find(params[:contact_person_id])
    end
    @order.member_id = current_member.id
    @order.sub_total = current_cart.sub_total
    #if params[:child].present?
    #  Child.create!([{first_name: params[:first_name], last_name: 'params[:child][:last_name]', birthdate: 'params[:child][:birthdate]', member_id: current_member.id, course_niveau_id: '1'}])
    #end

    #if @child.present?
    #  @items.each do |item|
    #    Participation.create!([{member_id: "#{current_member.id}", course_id: "#{item.course.id}", child_id: "#{@child.id}", grandparent_id: "#{@grandparent.id if @grandparent.present?}", contact_person_id: "#{@contact_person.id if @contact_person.present?}", order_id: "#{@order.id}"}])
    #  end
    #end

    @items.each do |i|
      @participations = Participation.where(course_id: i.course)
      if @participations.count == i.course.limit
        i.course.fullbooket!
      end
    end

    @first_item = @items.first
    @course = @first_item.course
    @participations = Participation.where(course_id: @course)
    if @participations.count == @course.limit
      @course.fullbooket!
    end
    @member = current_member
    @participation = @participations.first

    MemberMailer.received(@member,@participation).deliver

    if @order.update_attributes(order_params.merge(status: 'open'))
      session[:cart_token] = nil
      @order.create_power_office_invoice
      redirect_to @order, notice: "<svg version='1.1' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 130.2 130.2'>
  <circle class='path circle' fill='none' stroke='#73AF55' stroke-width='6' stroke-miterlimit='10' cx='65.1' cy='65.1' r='62.1'/>
  <polyline class='path check' fill='none' stroke='#73AF55' stroke-width='6' stroke-linecap='round' stroke-miterlimit='10' points='100.2,40.2 51.5,88.8 29.8,67.5 '/>
</svg>
<br>
<p class='success' style='text-align: center;margin: 20px 0 60px;font-size: 1.25em;'>Ordrer sendes til PowerOffice, slik at vi kan sørge for at du er satt opp for riktig kurs - vent på bekreftelse!</p>"
    else
      render :new
    end

  end

  private

  def check_member
    #if current_member.id != @order.member_id
      #redirect_to root_url, alert: "Kan ikke finde din ordre."
    #end
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:child_first_name, :child_last_name, :participant_birthday, :first_name, :last_name, :member_id, :email, :sub_total, :participant_birthday, members_attributes: [:first_name, :last_name, :email, :password, :password_confirmation, :id, :destroy], children_attributes: [:id, :destroy, :first_name, :last_name, :member_id, :course_id, :order_id, :birthdate, :course_niveau_id, :level])
  end
end

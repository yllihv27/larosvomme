class MembersController < ApplicationController
  before_action :set_member, only: [:show, :update, :edit, :destroy]
  before_action :check_member, only: [:show, :edit, :update]
  #before_action :authenticate_member!, only: [:show]
  #before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_coach!, except: [:new, :edit, :update, :create, :show, :tilfoj_barn, :gdpr]
  skip_before_action :verify_authenticity_token

  def gdpr
    @member = Member.find_by_id(params[:id])
    @children = Child.where(member_id: @member)
    @grandparents = Grandparent.where(member_id: @member)
    @contact_people = Grandparent.where(member_id: @member)
    if params[:commit]
      MemberMailer.gdpr(current_member,@children,@grandparents,@contact_people).deliver
      redirect_to member_gdpr_path, notice: "Dine data er sendt til #{current_member.email}. For mer informasjon, sjekk vår personvernpolicy hvor du får mer info om hvor, hvordan og hvorfor vi lagrer dataene dine."
    end
  end

  def show
    @courses = Course.where(member_id: @member)
    @participations = Participation.where(member_id: @member)
    @participation = Participation.new
    @children = Child.where(member_id: @member)
    @grandparents = Grandparent.where(member_id: @member)
    @contact_people = ContactPerson.where(member_id: @member)
    if member_signed_in? 
      render layout: 'account'
    end
  end

  def tilfoj_barn
    @child = Child.new
    @member = current_member
  end

  def index
  	@courses = Course.all.order('day DESC')
    @course = Course.find_by(params[:id])
    @counts = Participation.where(course_id: @course)
  	@members = Member.all
    @participations = Participation.all
    @participation = Participation.find_by(params[:id])
    @member = Member.find_by(params[:id])
    #@course_members = Member.where(params[:course_id] == @course.id)
    #@course_members = Member.where(params[:course_id] == course.id)
  end

  def kontoer
    @courses = Course.all.order('day DESC')
    @course = Course.find_by(params[:id])
    @counts = Participation.where(course_id: @course)
    @members = Member.all.order('created_at DESC').page(params[:page])
    @participations = Participation.all
    @participation = Participation.find_by(params[:id])
    @member = Member.find_by(params[:id])
    #@course_members = Member.where(params[:course_id] == @course.id)
    #@course_members = Member.where(params[:course_id] == course.id)
  end

  def edit
    @courses = Course.where(member_id: @member)
    @participations = Participation.where(member_id: @member)
    @participation = Participation.new
    @children = Child.where(member_id: @member)
    @grandparents = Grandparent.where(member_id: @member)
    @contact_people = ContactPerson.where(member_id: @member)
    if member_signed_in? 
      render layout: 'account'
    end
  end

  def new
    @member = Member.new
  end

  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'member day was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Din konto ble oppdatteret.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end
  private

    def check_member
      unless current_coach
        if current_member != @member
          redirect_to root_url, alert: "Beklager, denne profilen tilhører noen andre."
        end
      end
    end

    def set_member
      @member = Member.find(params[:id])
    end

    #def set_course
    #  @course = Course.find(params[:id])
    #end

    def member_params
      params.require(:member).permit(:id, :first_name, :last_name, :profile_pic, :email, :password, :password_confirmation, :course_id, :phone, :gdpr, :address, :zipcode, :city, children_attributes: [:first_name, :last_name, :member_id, :course_id, :id, :destroy])
    end
end
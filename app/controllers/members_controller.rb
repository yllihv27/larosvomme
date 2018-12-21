class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_coach!, except: [:show, :create]
  before_action :check_member


  def show
	  @member = Member.find(params[:id])
    @courses = Course.where(member_id: @member)
  end

  def index
  	@courses = Course.all
    # = Course.find_by(params[:course_id])
  	@members = Member.all
    #@course_members = Member.where(params[:course_id] == @course.id)
    #@course_members = Member.where(params[:course_id] == course.id)
  end

  def edit
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      MemberMailer.welcome(@member).deliver
      sign_in(@member)
      redirect_to @member
    end
  end

  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'member day was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private

    def check_member
      if current_member != @member
        redirect_to root_url, alert: "Beklager, denne profilen tilhører noen andre."
      end
    end

    def set_member
      @member = Member.find(params[:id])
    end

    def member_params
      params.require(:member).permit(:id, :first_name, :last_name, :profile_pic, :email, :password, :password_confirmation, :course_id)
    end
end
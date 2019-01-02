class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_coach!, only: [:edit_courses, :edit, :update, :destroy]

  def modal
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index
    @courses = Course.all.order('day ASC').page(params[:page])

    if params[:course_niveau_id].present?
        course_niveau = CourseNiveau.find(params[:course_niveau_id])
        @courses = course_niveau.courses.page(params[:page])
     else
      @courses = @courses.page(params[:page])
    end

    if params[:course_place_id].present?
      course_place = CoursePlace.find(params[:course_place_id])
      @courses = course_place.courses.page(params[:page])
     else
      @courses = @courses.page(params[:page])
    end

    if params[:course_category_id].present?
      course_category = CourseCategory.find(params[:course_category_id])
      @courses = course_category.courses.page(params[:page])
     else
      @courses = @courses.page(params[:page])
    end

    if params[:day].present?
      @courses = @courses.where(day: params[:day]).page(params[:page])
     else
      @courses = @courses.page(params[:page])
    end

    @member = Member.new

  end

  def edit_courses
    @courses = Course.all
    render :edit_courses
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @members = Member.all
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Kurset ble opprettet.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Kurset ble oppdatert.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Kurset ble slettet.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :description, :price, :coach_id, :course_niveau_id, :course_place_id, :course_day_id, :course_category_id, :age_from, :age_to, :time_from, :time_to, :course_image, :day, :member_id)
    end
end

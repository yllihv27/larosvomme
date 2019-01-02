class GrandparentsController < ApplicationController
  before_action :set_grandparent, only: [:show, :edit, :update, :destroy]

  # GET /grandparents
  # GET /grandparents.json
  def index
    @grandparents = Grandparent.all
  end

  # GET /grandparents/1
  # GET /grandparents/1.json
  def show
  end

  # GET /grandparents/new
  def new
    @grandparent = Grandparent.new
  end

  # GET /grandparents/1/edit
  def edit
  end

  # POST /grandparents
  # POST /grandparents.json
  def create
    @grandparent = Grandparent.new(grandparent_params)
    @grandparent.member_id = current_member

    respond_to do |format|
      if @grandparent.save
        format.html { redirect_to @grandparent, notice: 'Grandparent was successfully created.' }
        format.json { render :show, status: :created, location: @grandparent }
      else
        format.html { render :new }
        format.json { render json: @grandparent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grandparents/1
  # PATCH/PUT /grandparents/1.json
  def update
    respond_to do |format|
      if @grandparent.update(grandparent_params)
        format.html { redirect_to @grandparent, notice: 'Grandparent was successfully updated.' }
        format.json { render :show, status: :ok, location: @grandparent }
      else
        format.html { render :edit }
        format.json { render json: @grandparent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grandparents/1
  # DELETE /grandparents/1.json
  def destroy
    @grandparent.destroy
    respond_to do |format|
      format.html { redirect_to grandparents_url, notice: 'Grandparent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grandparent
      @grandparent = Grandparent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grandparent_params
      params.require(:grandparent).permit(:first_name, :last_name, :member_id, :child_id, :course_id)
    end
end

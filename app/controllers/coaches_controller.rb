class CoachesController < ApplicationController
  before_action :set_coach, only: [:show, :edit, :update, :destroy]

  def index
  	@coaches = Coach.all
  end

  def show
	  @coach = Coach.find(params[:id])
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coach
      @coach = Coach.find(params[:id])
    end
end
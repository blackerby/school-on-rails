class BuildingsController < ApplicationController
  def index
    @buildings = Building.all
  end

  def show
    @building = Building.find(params[:id])
    @classrooms = Classroom.where(building_id: @building.id)
  end
end

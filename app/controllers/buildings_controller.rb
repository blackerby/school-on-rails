class BuildingsController < ApplicationController
  def index
    @buildings = if params[:query].present?
                   Building.filter_by_name(params[:query])
                 else
                   Building.order(:name)
                 end
  end

  def show
    @building = Building.find(params[:id])
    @classrooms = Classroom.where(building_id: @building.id)
  end

  def edit
    @building = Building.find(params[:id])
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)

    if @building.save
      redirect_to @building, notice: 'Building successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @building = Building.find(params[:id])
    if @building.update(building_params)
      redirect_to @building, notice: 'building successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @building = Building.find(params[:id])
    @building.destroy
    redirect_to buildings_url, status: :see_other, alert: 'Building successfully deleted.'
  end

  private

  def building_params
    params.require(:building).permit(:name)
  end
end

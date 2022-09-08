class ClassroomsController < ApplicationController
  before_action :set_classroom, except: %i[index new create]

  def index
    @classrooms = if params[:query].present?
                    Classroom.filter_by_name(params[:query])
                  else
                    Classroom.order('length(name), name')
                  end
  end

  def new
    @classroom = Classroom.new
  end

  def create
    @classroom = Classroom.new(classroom_params)

    if @classroom.save
      redirect_to classrooms_path, notice: 'Classroom successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @meetings = @classroom.meetings.order(:block_id)
    @free = @classroom.free_blocks
  end

  def update
    if @classroom.update(classroom_params)
      redirect_to @classroom, notice: 'Classroom successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @classroom.destroy
    redirect_to teachers_url, status: :see_other, alert: 'Classroom successfully deleted.'
  end

  private

  def classroom_params
    params.require(:classroom).permit(:name)
  end

  def set_classroom
    @classroom = Classroom.find(params[:id])
  end
end

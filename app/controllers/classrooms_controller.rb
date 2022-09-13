class ClassroomsController < ApplicationController
  before_action :set_classroom, except: %i[index new create]

  def index
    @classrooms = if params[:query].present?
                    Classroom.filter_by_name(params[:query])
                  else
                    Classroom.order('length(name), name')
                  end
  end

  def show
    @meetings = @classroom.meetings.order(:block_id)
    @free = @classroom.free_blocks
  end

  private

  def classroom_params
    params.require(:classroom).permit(:name)
  end

  def set_classroom
    @classroom = Classroom.find(params[:id])
  end
end

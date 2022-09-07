class ClassroomsController < ApplicationController
  def index
    @classrooms = if params[:query].present?
                    Classroom.filter_by_name(params[:query])
                  else
                    Classroom.order('length(name), name')
                  end
  end

  def show
    @classroom = Classroom.find(params[:id])
    @meetings = @classroom.meetings
    @free = @classroom.free_blocks
  end
end

class ClassroomsController < ApplicationController
  def index
    @classrooms = if params[:query].present?
                    Classroom.filter_by_name(params[:query])
                  else
                    Classroom.all
                  end
  end

  def show
    @classroom = Classroom.find(params[:id])
    @meetings = @classroom.meetings
  end
end

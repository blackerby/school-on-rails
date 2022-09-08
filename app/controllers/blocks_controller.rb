class BlocksController < ApplicationController
  def index
    @blocks = if params[:query].present?
                Block.filter_by_name(params[:query])
              else
                Block.all
              end
  end

  def show
    @block = Block.find(params[:id])
    @meetings = @block.meetings.order(:teacher_id)
    @free_teachers = @block.free_teachers
    @classrooms = @block.classrooms
    @free_classrooms = @block.free_classrooms
  end
end

class BlocksController < ApplicationController
  before_action :set_block, only: %i[show edit update destroy]

  def index
    @blocks = if params[:query].present?
                Block.filter_by_name(params[:query])
              else
                Block.all
              end
  end

  def show
    @meetings = @block.meetings.order(:teacher_id)
    @free_teachers = @block.free_teachers
    @classrooms = @block.classrooms
    @free_classrooms = @block.free_classrooms
  end

  private

  def block_params
    params.require(:block).permit(:name)
  end

  def set_block
    @block = Block.find(params[:id])
  end
end

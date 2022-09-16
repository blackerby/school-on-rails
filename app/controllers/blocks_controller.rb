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

  def new
    @block = Block.new
  end

  def create
    @block = Block.new(block_params)
    if @block.save
      redirect_to @block, notice: 'Block successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @block.update(block_params)
      redirect_to @block, notice: 'Block successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @block.destroy
    redirect_to blocks_url, status: :see_other, alert: 'Block successfully deleted.'
  end

  def free_classrooms
    @block = Block.find(params[:block_id])
    @target = params[:target]
    @free_classrooms = @block.free_classrooms
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def block_params
    params.require(:block).permit(:name)
  end

  def set_block
    @block = Block.find(params[:id])
  end
end

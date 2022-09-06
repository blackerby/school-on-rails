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
    @meetings = @block.meetings
  end
end

class TeachersController < ApplicationController
  before_action :set_teacher, except: %i[index new create]

  def index
    @teachers = if params[:query].present?
                  Teacher.filter_by_name(params[:query])
                else
                  Teacher.order(:last_name)
                end
  end

  def show
    @department = @teacher.department
    @meetings = @teacher.meetings.order(:block_id)
    @free = @teacher.free_blocks
  end

  private

  def teacher_params
    params.require(:teacher).permit(
      :first_name, :last_name, :email, :department_id
    )
  end

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end
end

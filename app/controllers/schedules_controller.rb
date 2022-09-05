class SchedulesController < ApplicationController
  def new
    @teacher = Teacher.find(params[:teacher_id])
    @schedule = @teacher.build_schedule
    @schedule.meetings.build
  end

  def create
    @teacher = Teacher.find(params[:teacher_id])
    @schedule = @teacher.build_schedule(schedule_params)
    if @schedule.save
      redirect_to @teacher, notice: 'Schedule successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(meetings_attributes: %i[block_id classroom_id])
  end
end

class SchedulesController < ApplicationController
  def new
    @teacher = Teacher.find(params[:teacher_id])
    @schedule = @teacher.create_schedule
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

  def edit
    @teacher = Teacher.find(params[:teacher_id])
    @schedule = @teacher.schedule
    @blocks = @schedule.meetings.map(&:block)
  end

  def update
    @teacher = Teacher.find(params[:id])
    @schedule = @teacher.schedule
    if @schedule.update(schedule_params)
      redirect_to @teacher, notice: 'Schedule successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(meetings_attributes: %i[id block_id classroom_id])
  end
end

class MeetingsController < ApplicationController
  def new
    @teacher = Teacher.find(params[:teacher_id])
    @schedule = @teacher.schedule
    @meeting = @schedule.meetings.new
  end

  def create
    @teacher = Teacher.find(params[:teacher_id])
    @schedule = @teacher.schedule
    @meeting = @schedule.meetings.new(meeting_params)
    if @meeting.save
      redirect_to @teacher, notice: 'Class successfully added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(%i[id block_id classroom_id])
  end
end

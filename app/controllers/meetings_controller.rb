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

  def edit
    @teacher = Teacher.find(params[:teacher_id])
    @schedule = Schedule.find(params[:schedule_id])
    @meeting = Meeting.find(params[:id])
  end

  def destroy
    @teacher = Teacher.find(params[:teacher_id])
    @schedule = @teacher.schedule
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    redirect_to edit_teacher_schedule_url(@teacher, @schedule), status: :see_other, alert: 'Class successfully deleted.'
  end

  private

  def meeting_params
    params.require(:meeting).permit(%i[id block_id classroom_id])
  end
end

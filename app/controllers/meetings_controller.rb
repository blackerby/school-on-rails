class MeetingsController < ApplicationController
  def new
    @teacher = Teacher.find(params[:teacher_id])
    @meeting = @teacher.meetings.new
  end

  def create
    @teacher = Teacher.find(params[:teacher_id])
    @meeting = @teacher.meetings.new(meeting_params)

    if @meeting.save
      redirect_to teacher_path(@teacher), notice: 'Class meeting successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(:classroom_id, :block_id)
  end
end

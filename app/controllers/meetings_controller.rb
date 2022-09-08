class MeetingsController < ApplicationController
  before_action :set_teacher
  before_action :set_meeting, except: %i[new create]

  def new
    @meeting = @teacher.meetings.new
  end

  def create
    @meeting = @teacher.meetings.new(meeting_params)

    if @meeting.save
      redirect_to teacher_path(@teacher), notice: 'Class meeting successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @meeting.destroy
    redirect_to teacher_url(@teacher), status: :see_other, alert: 'Class meeting successfully deleted.'
  end

  def edit; end

  def update
    if @meeting.update(meeting_params)
      redirect_to @teacher, notice: 'Class meeting successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(:classroom_id, :block_id, :course_title)
  end

  def set_teacher
    @teacher = Teacher.find(params[:teacher_id])
  end

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end
end

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

  def destroy
    @teacher = Teacher.find(params[:teacher_id])
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    redirect_to teacher_url(@teacher), status: :see_other, alert: 'Class meeting successfully deleted.'
  end

  def edit
    @teacher = Teacher.find(params[:teacher_id])
    @meeting = Meeting.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:teacher_id])
    @meeting = Meeting.find(params[:id])
    if @meeting.update(meeting_params)
      redirect_to @teacher, notice: 'Class meeting successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(:classroom_id, :block_id)
  end
end

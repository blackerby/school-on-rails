class TeachersController < ApplicationController
  def index
    @teachers = if params[:query].present?
                  Teacher.filter_by_name(params[:query])
                else
                  Teacher.all
                end
  end

  def show
    @teacher = Teacher.find(params[:id])
    @department = @teacher.department
    @meetings = @teacher.meetings
    @blocks = @teacher.blocks
    @free = @teacher.free
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update(teacher_params)
      redirect_to @teacher, notice: 'Teacher successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @teacher = Teacher.new
    7.times { @teacher.meetings.build }
  end

  def create
    @teacher = Teacher.new(teacher_params)
    begin
      @teacher.save
    rescue StandardError
      @teacher.errors.add(:schedule, 'block/classroom combinations must be unique.')
      render :new, status: :unprocessable_entity
    else
      redirect_to @teacher, notice: 'Teacher successfully created.'
    end
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy
    redirect_to teachers_url, status: :see_other, alert: 'Teacher successfully deleted.'
  end

  private

  def teacher_params
    params.require(:teacher).permit(
      :first_name, :last_name, :email, :department_id,
      meetings_attributes: %i[id block_id classroom_id]
    )
  end
end

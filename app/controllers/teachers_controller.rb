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
    @meetings = @teacher.meetings
    @free = @teacher.free_blocks
  end

  def edit; end

  def update
    if @teacher.update(teacher_params)
      redirect_to @teacher, notice: 'Teacher successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to @teacher, notice: 'Teacher successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @teacher.destroy
    redirect_to teachers_url, status: :see_other, alert: 'Teacher successfully deleted.'
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

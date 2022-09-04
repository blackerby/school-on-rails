class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
    @department = @teacher.department
    @blocks = @teacher.blocks
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
    @teacher = Teacher.find(params[:id])
    @teacher.destroy
    redirect_to teachers_url, status: :see_other, alert: 'Teacher successfully deleted.'
  end

  private

  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :email, :department_id, block_ids: [])
  end
end

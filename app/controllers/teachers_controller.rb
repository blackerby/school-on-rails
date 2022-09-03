class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    teacher_params = params.require(:teacher).permit(:first_name, :last_name, :email)
    @teacher.update(teacher_params)
    redirect_to @teacher
  end
end

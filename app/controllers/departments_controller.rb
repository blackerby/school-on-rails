class DepartmentsController < ApplicationController
  before_action :set_department, except: %i[index new create]

  def index
    @departments = if params[:query].present?
                     Department.filter_by_name(params[:query])
                   else
                     Department.order(:name)
                   end
  end

  def show
    @teachers = @department.teachers
  end

  private

  def department_params
    params.require(:department).permit(:name)
  end

  def set_department
    @department = Department.find(params[:id])
  end
end

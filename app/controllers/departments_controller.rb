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

  def edit; end

  def update
    if @department.update(department_params)
      redirect_to @department, notice: 'Department successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to @department, notice: 'Department successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @department.destroy
    redirect_to departments_url, status: :see_other, alert: 'Department successfully deleted.'
  end

  private

  def department_params
    params.require(:department).permit(:name)
  end

  def set_department
    @department = Department.find(params[:id])
  end
end

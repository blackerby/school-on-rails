class SchedulesController < ApplicationController
  def new
    @teacher = Teacher.find(params[:teacher_id])
  end
end

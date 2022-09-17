class ChangeTeachersDepartmentIdNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :teachers, :department_id, true
  end
end

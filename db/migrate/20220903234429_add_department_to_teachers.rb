class AddDepartmentToTeachers < ActiveRecord::Migration[7.0]
  def change
    add_reference :teachers, :department, null: false, foreign_key: true
  end
end

class ChangeDepartmentsNameNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :departments, :name, false
  end
end

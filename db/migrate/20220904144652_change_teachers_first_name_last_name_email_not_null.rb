class ChangeTeachersFirstNameLastNameEmailNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :teachers, :first_name, false
    change_column_null :teachers, :last_name, false
    change_column_null :teachers, :email, false
  end
end

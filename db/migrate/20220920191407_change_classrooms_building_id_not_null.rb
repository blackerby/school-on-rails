class ChangeClassroomsBuildingIdNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :classrooms, :building_id, true
  end
end

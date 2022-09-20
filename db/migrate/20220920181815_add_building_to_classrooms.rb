class AddBuildingToClassrooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :classrooms, :building, foreign_key: true
  end
end

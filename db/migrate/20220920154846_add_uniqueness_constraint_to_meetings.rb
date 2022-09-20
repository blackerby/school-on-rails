class AddUniquenessConstraintToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_index :meetings, %i[block_id teacher_id], unique: true
  end
end

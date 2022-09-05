class DropIndexesFromMeetingsAndAddUniqueIndex < ActiveRecord::Migration[7.0]
  def change
    remove_index :meetings, :block_id
    remove_index :meetings, :teacher_id
    remove_index :meetings, :classroom_id

    add_index :meetings, %i[block_id teacher_id classroom_id], unique: true
  end
end

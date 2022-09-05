class DropTeacherBlocks < ActiveRecord::Migration[7.0]
  def change
    drop_table :teacher_blocks, force: :cascade
  end
end

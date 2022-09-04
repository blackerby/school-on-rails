class CreateTeacherBlocks < ActiveRecord::Migration[7.0]
  def change
    create_table :teacher_blocks do |t|
      t.references :teacher, null: false, foreign_key: true
      t.references :block, null: false, foreign_key: true

      t.timestamps
    end
  end
end

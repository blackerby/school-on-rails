class CreateClassroomBlocks < ActiveRecord::Migration[7.0]
  def change
    create_table :classroom_blocks do |t|
      t.references :classroom, null: false, foreign_key: true
      t.references :block, null: false, foreign_key: true

      t.timestamps
    end
  end
end

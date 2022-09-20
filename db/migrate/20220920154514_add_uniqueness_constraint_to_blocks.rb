class AddUniquenessConstraintToBlocks < ActiveRecord::Migration[7.0]
  def change
    add_index :blocks, :name, unique: true
  end
end

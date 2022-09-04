class ChangeBlocksNameNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :blocks, :name, false
  end
end

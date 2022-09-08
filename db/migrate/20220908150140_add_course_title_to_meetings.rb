class AddCourseTitleToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :course_title, :string
  end
end

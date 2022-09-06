class Meeting < ApplicationRecord
  belongs_to :schedule, optional: true

  validates :block_id, uniqueness: { scope: %i[schedule_id classroom_id] }

  def block
    Block.find(block_id)
  end

  def classroom
    Classroom.find(classroom_id)
  end
end

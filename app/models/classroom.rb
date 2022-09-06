class Classroom < ApplicationRecord
  include Filterable

  validates :name, presence: true

  def meetings
    Meeting.where(classroom_id: id)
  end

  def free_blocks
    Block.where.not(id: meetings)
  end
end

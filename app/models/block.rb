class Block < ApplicationRecord
  include Filterable

  validates :name, presence: true

  def meetings
    Meeting.where(block_id: id)
  end

  def free_teachers
    Teacher.where.not(id: meetings.map(&:schedule).map(&:teacher))
  end
end

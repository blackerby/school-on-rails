class Block < ApplicationRecord
  include Filterable

  validates :name, presence: true

  def teachers
    Meeting.where(block_id: id).map(&:schedule).map(&:teacher)
  end
end

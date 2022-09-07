class Classroom < ApplicationRecord
  include Filterable

  has_many :meetings
  has_many :teachers, through: :meetings
  has_many :blocks, through: :meetings

  validates :name, presence: true

  def free_blocks
    Block.where.not(id: block_ids)
  end
end
